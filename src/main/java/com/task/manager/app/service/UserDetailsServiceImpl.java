package com.task.manager.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.task.manager.app.dao.AuthRepository;
import com.task.manager.app.dao.UserRepository;
import com.task.manager.app.model.Auth;
import com.task.manager.app.model.UserNew;




@Service
public class UserDetailsServiceImpl implements UserDetailsService {
@Autowired
private UserRepository userDao;
@Autowired
private AuthRepository authDao;
@Override
public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	UserNew u=userDao.findUserByName(username);
	  if (u == null) {
          System.out.println("User not found! " + username);
          throw new UsernameNotFoundException("User " + username + " was not found in the database");
      }
	  List<Auth> auth=authDao.findAuthByName(u.getName());
	  System.out.println("Found User: " + username);
	  List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
	  
	  if(auth!=null) {
		  grantList.add( new SimpleGrantedAuthority( auth.get(0).getAuthority()));
	  }
	  UserDetails userDetails = (UserDetails) new User(u.getName(), //
              u.getPassword(), grantList);
	return userDetails;
}

}
