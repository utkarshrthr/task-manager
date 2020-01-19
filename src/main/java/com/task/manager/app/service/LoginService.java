package com.task.manager.app.service;

import com.task.manager.app.model.UserNew;

public interface LoginService {
	public UserNew findUser(String name);
}
