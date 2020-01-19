package com.task.manager.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.manager.app.dao.UserRepository;
import com.task.manager.app.model.UserNew;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired 
	private UserRepository userDao;
	
	@Override
	public List<UserNew> retrieveUsers() {
		return userDao.findAll();
	}
}
