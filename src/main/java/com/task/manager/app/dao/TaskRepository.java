package com.task.manager.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.task.manager.app.model.Task;

public interface TaskRepository extends JpaRepository<Task, Long> {

	List<Task> findTaskByUserName(String userName);
}