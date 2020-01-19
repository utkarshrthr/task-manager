package com.task.manager.app.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.task.manager.app.service.UserServiceImpl;
import com.task.manager.app.utils.AppURLs;
import com.task.manager.app.utils.AppUtils;

@Controller
@RequestMapping(value = AppURLs.BASE_URL_APP_USERS_VERIFY)
@SessionAttributes("name")
public class UserVerificatonController {

	@Autowired
	private UserServiceImpl userService;

	@PostMapping(value="/email", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<String> verifyUserEmail(@RequestParam(name = "email", required = true) String email){
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean existwithemail=  userService.checkifuserAlreadyExists(email,result);
		String message = existwithemail ? "User Exists" : "User does not exist";
		result.put("message",  message);
		String response = AppUtils.convertMapToStr(result);
		HttpHeaders responseHeaders = new HttpHeaders(); 
		responseHeaders.add("Content-Type", MediaType.APPLICATION_JSON_VALUE); 
		return new ResponseEntity<String>(response, responseHeaders, HttpStatus.CREATED);
	}
	
	@PostMapping(value="/username", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<String> verifyUserName(@RequestParam(name = "username", required = true) String username){
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean existwithname=  userService.checkifuserAlreadyExistsWithName(username,result);
		String message = existwithname ? "User Exists" : "User does not exist";
		result.put("message",  message);
		String response = AppUtils.convertMapToStr(result);
		HttpHeaders responseHeaders = new HttpHeaders(); 
		responseHeaders.add("Content-Type", MediaType.APPLICATION_JSON_VALUE); 
		return new ResponseEntity<String>(response, responseHeaders, HttpStatus.CREATED);
	}
}
