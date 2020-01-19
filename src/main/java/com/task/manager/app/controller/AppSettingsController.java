package com.task.manager.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.task.manager.app.utils.AppURLs;

@Controller
@RequestMapping(value = AppURLs.BASE_URL_APP_SETTINGS)
public class AppSettingsController {

	@GetMapping("/")
	public String getAppSettings(ModelMap map) {
		map.addAttribute("title", "Settings");
		return "settings";
	}
	
	@GetMapping("/theme")
	public @ResponseBody String updateAppTheme(HttpSession session, @RequestParam(value = "theme", defaultValue = "light") String theme) {
		session.setAttribute("currentTheme", theme);
		return "success";
	}
}
