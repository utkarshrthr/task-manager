package com.task.manager.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.manager.app.dao.UserRepository;
import com.task.manager.app.model.UserNew;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserRepository userDao;
	
	@Override
	public UserNew findUser(String name) {
		return userDao.findUserByName(name);
	}
}
