package com.task.manager.app.service;

import java.util.List;

import com.task.manager.app.model.Task;

public interface TaskService {

    public List<Task> retrieveTasks(String username);
	public Task addTask(String taskTitle, String description, String assignee, String starton, String doneby, String status, int userId, String name);
	public void deleteTask(String userId);
	public void assignTask(String username, String adminname);
}
