package com.task.manager.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.task.manager.app.dao.AuthRepository;
import com.task.manager.app.dao.UserRepository;
import com.task.manager.app.model.Auth;
import com.task.manager.app.model.UserNew;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userDao;
	
	@Autowired
	private AuthRepository authDao;

	@Override
	public boolean addUser(String name, String password, String email, String ques, String ans) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		try {
			UserNew u = new UserNew();
			u.setName(name);
			u.setPassword(encoder.encode(password));
			u.setEmail(email);
			u.setSecurityQuestion(ques);
			u.setAnswer(ans);
			userDao.save(u);
			Auth a = new Auth();
			a.setName(name);
			a.setAuthority("user");
			authDao.save(a);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean checkifuserAlreadyExists(String email, HashMap<String, Object> result) {
		List<UserNew> user = userDao.findAllUsersWithEmai(email);

		if (user.size() > 0) {
			result.put("question", user.get(0).getSecurityQuestion());
			result.put("answer", user.get(0).getAnswer());
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean checkifuserAlreadyExistsWithName(String name, HashMap<String, Object> result) {
		UserNew user = userDao.findUserByName(name);

		if (user != null) {
			result.put("question", user.getSecurityQuestion());
			result.put("answer", user.getAnswer());
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String getUserCredentials(String email) {

		List<UserNew> user = userDao.findUserNewByEmail(email);
		UserNew u = userDao.findUserByName(email);
		String username = "";
		String password = "";
		if (user.size() > 0) {
			username = user.get(0).getName();
			password = user.get(0).getPassword();
		} else {
			username = u.getName();
			password = u.getPassword();
		}
		String msg = "Your credentials are: Username: " + username + " Password: " + password;
		return msg;

	}

	@Override
	public boolean updateUserPassword(String email, String pass) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserNew user = userDao.findUserByNameOrEmail(email, email);
		if (user != null) {
			user.setPassword(encoder.encode(pass));
			userDao.save(user);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String getUserDetails(Long id) {
		UserNew user = userDao.findUserNewById(id);
		return user.getName() + "@#@" + user.getEmail();
	}

	@Override
	public String getRole(String name) {
		List<Auth> a = authDao.findAuthByName(name);
		String authority = "";
		if (a.size() > 0) {
			authority = a.get(0).getAuthority();
		} else {
			authority = "not assigned";
		}
		return authority;
	}

	@Override
	public String deleteUser(Long id) {
		UserNew u=userDao.findUserNewById(id);
		String username=u.getName();
		userDao.deleteById(id);
		authDao.deleteAuthByName(username);
		return username;
	}
}
