package com.task.manager.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping
public class AppController {
	
	@GetMapping(path = {"/", "/task-manager", "/task-manager/app"})
	public String showhomepage(@RequestParam(value = "error", required = false) String error){
		return "redirect:/task-manager/app/home";
	}
}
