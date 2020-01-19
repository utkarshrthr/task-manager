package com.task.manager.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.task.manager.app.model.Task;
import com.task.manager.app.service.TaskService;
import com.task.manager.app.utils.AppURLs;

@Controller
@SessionAttributes({ "userName", "id" })
@RequestMapping(value = AppURLs.BASE_URL_APP_USERS)
public class UserController extends BaseController {

	@Autowired
	private TaskService taskService;

	@GetMapping("/dashboard")
	public String showTodos(ModelMap map) {
		String name = (String) map.get("userName");
		List<Task> list = taskService.retrieveTasks(name);
		map.put("tasks", list);
		map.put("title", "Dashboard");
		map.put("currentUserName", getLoggedInUserName());
		return "dashboardUser";
	}
}
