package com.task.manager.app.controller;

import java.util.HashMap;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.task.manager.app.model.Task;
import com.task.manager.app.service.TaskService;
import com.task.manager.app.utils.AppURLs;

@Controller
@SessionAttributes({ "userName", "id" })
@RequestMapping(value = AppURLs.BASE_URL_APP_USERS)
public class TaskController {

	@Autowired
	private TaskService taskService;
	
	@PostMapping(value = "/task", produces =  MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<String> addTodos(ModelMap model, @RequestParam String taskTitle, @RequestParam String description, @RequestParam String assignee, @RequestParam String starton,@RequestParam String doneby,@RequestParam String status) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String json = null;
		SecurityContext context = SecurityContextHolder.getContext();
		String name = context.getAuthentication().getName();
		int id = (int) model.getAttribute("id");
		Task task = taskService.addTask(taskTitle, description, assignee, starton,doneby,status, id, name);
		result.put("data", task.getId());
		ObjectMapper map = new ObjectMapper();
		if (!result.isEmpty()) {
			try {
				json = map.writeValueAsString(result);
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
	}
	
	@DeleteMapping(value = "/task", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<String> delTodos(ModelMap model, @RequestParam String task) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String json = null;
		taskService.deleteTask(task);
		result.put("output", "deleted");
		ObjectMapper map = new ObjectMapper();
		if (!result.isEmpty()) {
			try {
				json = map.writeValueAsString(result);
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
	}
}
