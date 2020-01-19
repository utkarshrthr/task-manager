package com.task.manager.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.task.manager.app.model.Todo;

public interface TodoRepository extends JpaRepository<Todo, Integer> {

	List<Todo> findTodoByUsername(String username);
}
