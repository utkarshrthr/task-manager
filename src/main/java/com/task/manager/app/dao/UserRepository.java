package com.task.manager.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.task.manager.app.model.UserNew;

@Repository
public interface UserRepository extends JpaRepository<UserNew, Long>{
	
	@Query(value = "SELECT u FROM UserNew u where email=?1")
	List<UserNew> findAllUsersWithEmai(String email);
	
	@Query(value = "SELECT u.id FROM UserNew u where name=?1 AND password=?2")
	List<Integer> findIdIfLogin(String name, String password);

	List<UserNew> findUserNewByEmail(String email);

	UserNew findUserByName(String name);

	UserNew findUserByNameOrEmail(String name, String email);

	UserNew findUserNewById(Long id);
}
