package com.task.manager.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.task.manager.app.model.Task;
import com.task.manager.app.model.UserNew;
import com.task.manager.app.service.AdminService;
import com.task.manager.app.service.TaskService;
import com.task.manager.app.service.UserServiceImpl;
import com.task.manager.app.utils.AppURLs;
import com.task.manager.app.utils.AppUtils;

@Controller
@RequestMapping(value = AppURLs.BASE_URL_APP_ADMIN)
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private TaskService taskService;
	
	@GetMapping(value="/dashboard")
	public String welcomeAdmin(ModelMap map){
		List<UserNew> users=adminService.retrieveUsers();
		SecurityContext context = SecurityContextHolder.getContext();
		String adminname = context.getAuthentication().getName();
		users = users.stream().filter(p->!p.getName().equalsIgnoreCase(adminname)).collect(Collectors.toList());
		map.put("users", users);
		map.put("title", "Dashboard Admin");
		return "dashboardAdmin";
	}
	
	@PostMapping(value = "/user", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<String> getDetail(ModelMap model, @RequestParam(name = "id", required = true) Long id) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String userdetail=userService.getUserDetails(id);
		String name=userdetail.split("@#@")[0];
		String email=userdetail.split("@#@")[1];
		List<Task> todo=taskService.retrieveTasks(name);
		String authority=userService.getRole(name);
		result.put("role", authority);
		result.put("taskcount", todo.size());
		result.put("name", name);
		result.put("email", email);
	 	String response = AppUtils.convertMapToStr(result);
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		return new ResponseEntity<String>(response, responseHeaders, HttpStatus.CREATED);
	}
	
	@DeleteMapping(value = "/user", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<String> deleteUser(ModelMap model, @RequestParam(name = "id", required = true)Long id) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		SecurityContext context = SecurityContextHolder.getContext();
		String adminname = context.getAuthentication().getName();
	 	String username=userService.deleteUser(id);
	 	taskService.assignTask(username,adminname);
	 	result.put("done", "done");
	 	String response = AppUtils.convertMapToStr(result);
	 	HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
	 	return new ResponseEntity<String>(response, responseHeaders, HttpStatus.CREATED);
	 }
}
