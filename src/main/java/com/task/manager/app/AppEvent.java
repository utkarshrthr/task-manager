package com.task.manager.app;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.task.manager.app.dao.AuthRepository;
import com.task.manager.app.dao.UserRepository;
import com.task.manager.app.model.Auth;
import com.task.manager.app.model.UserNew;

@Component
public class AppEvent {
	
	@Autowired
	private UserRepository userDao;
	
	@Autowired
	private AuthRepository authDao;

	private static final Logger LOGGER = LoggerFactory.getLogger(AppEvent.class);

	@EventListener(ApplicationReadyEvent.class)
	public void startApp() {
		
		//to add admin to newly created table
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		
		UserNew userNew = new UserNew();
		
		userNew.setName("admin1");
		userNew.setEmail("admin1@gmail.com");
		userNew.setPassword(encoder.encode("admin123"));
		userNew.setSecurityQuestion("What's your favourite colour?");
		userNew.setAnswer("black");
		
		UserNew admin = userDao.findUserByName("admin1");
		if (admin == null) {
			userDao.save(userNew);
			Auth authorities = new Auth();
			authorities.setName("admin1");
			authorities.setAuthority("admin");
			authDao.save(authorities);
			LOGGER.info("admin added");
		}
	}
}