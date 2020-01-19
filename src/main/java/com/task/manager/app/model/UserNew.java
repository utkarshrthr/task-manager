package com.task.manager.app.model;

import javax.persistence.Embedded;
import javax.persistence.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter 
@Setter 
@NoArgsConstructor
public class UserNew extends BaseEntity {
	
	private String name;
	    
	private String password;

	private String email;

	private String securityQuestion;
		
	private String answer;

	@Embedded
	public EntityCommonData commonData;
	
	public EntityCommonData getCommonData() {
		return commonData;
	}

	public void setCommonData(EntityCommonData commonData) {
		this.commonData = commonData;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public UserNew(String name, String password, String email, String securityQuestion, String answer) {
		this.name = name;
		this.password = password;
		this.email = email;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
	}
	
	public UserNew() {
		
	}
}
