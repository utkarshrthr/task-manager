package com.task.manager.app.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Controller
public class AppErrorController extends BaseController implements ErrorController {

	private static final String PATH = "/error";
	 
	@ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(code = HttpStatus.NOT_FOUND)
	@RequestMapping(path = "/error")
    public String handleResourceNotFoundException(ModelMap map) {
        map.put("title", "Page Not Found");
        map.put("currentUserName", getLoggedInUserName());
		return "notfound";
    }
	
	@Override
	public String getErrorPath() {
		return PATH;
	}
}
