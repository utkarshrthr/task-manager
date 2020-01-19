package com.task.manager.app.service;

import java.util.HashMap;

public interface UserService {

	public boolean addUser(String name, String password, String email, String question, String answer);

	public boolean checkifuserAlreadyExists(String email, HashMap<String, Object> result);

	public boolean checkifuserAlreadyExistsWithName(String name, HashMap<String, Object> result);

	public String getUserCredentials(String email);
	
	public boolean updateUserPassword(String email, String password);

	public String getUserDetails(Long id);

	public String getRole(String name);

	public String deleteUser(Long userId);
}
