package com.task.manager.app.service;

import java.util.List;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.task.manager.app.dao.TaskRepository;
import com.task.manager.app.model.Task;

@Service("taskService")
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskRepository taskdao;

	@Override
    public List<Task> retrieveTasks(String username) {
        if(!StringUtils.isEmpty(username))
        	return taskdao.findTaskByUserName(username);
        else return null;
    }

	@Override
	public Task addTask(String taskTitle, String description, String assignee, String starton, String doneby, String status, int userId, String username) {
		Task task=new Task(userId, description, assignee, new LocalDate(starton), new LocalDate(doneby), taskTitle, username, status);
		return taskdao.save(task);
	}

	@Override
	public void deleteTask(String taskId) {
		taskdao.deleteById(Long.parseLong(taskId));
	}

	@Override
	public void assignTask(String username, String adminname) {
		List<Task> userTasks= retrieveTasks(username);
		userTasks.stream().forEach( task -> task.setUserName(username));
	}
}