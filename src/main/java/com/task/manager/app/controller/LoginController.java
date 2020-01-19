package com.task.manager.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.task.manager.app.model.UserNew;
import com.task.manager.app.service.LoginServiceImpl;
import com.task.manager.app.utils.AppURLs;

import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes({"name","id"})
@Slf4j
@RequestMapping(value = AppURLs.BASE_URL_APP)
public class LoginController {
	
	@Autowired
    private LoginServiceImpl service;
	  
	@GetMapping("/home")
	public String showhomepage(@RequestParam(value = "error", required = false) String error){
		return "home";
	}
	  
	@GetMapping("/login")
    public String showLoginPage(ModelMap map, @RequestParam(value = "error", required = false) String error){
		if(error != null) {
			map.addAttribute("errorMessage", "Invalid Credentials !!!");
    	}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			if(auth.getAuthorities().iterator().next().getAuthority().equalsIgnoreCase("admin")) {
				return "redirect:../app/admin/dashboard";
    	    }
    	    else {
    	    	return "redirect:../app/user/dashboard";
    	    }
		}
		map.put("title", "Login");
        return "login";
    }

	@GetMapping("/loginCredentials")
    public String showWelcomePage(ModelMap model){
		SecurityContext context = SecurityContextHolder.getContext();
		String name = context.getAuthentication().getName();
		UserNew userNew = service.findUser(name);
        model.addAttribute("id", userNew.getId());
        model.addAttribute("name", name);
    	model.put("title", "Dashboard");
        return "redirect:/app/user/dashboard";
    }

	@GetMapping("/performLogOut")
    public String performLogOut(ModelMap model){
    	model.addAttribute("msg", "you have been successfully logged out !!!");
    	model.put("title", "Login");
        return "login";
    }
    
	@GetMapping("/errorHandle")
    public String errorHandle(ModelMap model){
    	model.addAttribute("errorMessage", "Invalid Credentials !!!");
    	model.put("title", "Login");
    	return "login";
    }
}
