package com.task.manager.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.task.manager.app.utils.AppURLs;

@Controller
@RequestMapping(value = AppURLs.BASE_URL_APP_USERS)
public class DocumentController {

	@GetMapping("/documents")
	public String getUserDocs(ModelMap map) {
		map.addAttribute("title", "Documents");
		return "documents";
	}
}
