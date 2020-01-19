package com.task.manager.app.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter 
@Setter 
@NoArgsConstructor
public class Todo {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
	
	private int userid;
    private String doer;
    private Date date;
    private String task;
    private String username;
    private Timestamp time;
    private boolean isDone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getDoer() {
		return doer;
	}
	public void setDoer(String doer) {
		this.doer = doer;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public boolean isDone() {
		return isDone;
	}
	public void setDone(boolean isDone) {
		this.isDone = isDone;
	}

	public Todo(int userid, String doer, Date date, String task, String username, Timestamp time, boolean isDone) {
		this.userid = userid;
		this.doer = doer;
		this.date = date;
		this.task = task;
		this.username = username;
		this.time = time;
		this.isDone = isDone;
	}
    
	public Todo() {
		
	}
}
