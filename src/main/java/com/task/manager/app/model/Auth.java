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
public class Auth extends BaseEntity {
 
	private String name;
	
	private String authority;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Embedded
	public EntityCommonData commonData;
	
	public EntityCommonData getCommonData() {
		return commonData;
	}

	public void setCommonData(EntityCommonData commonData) {
		this.commonData = commonData;
	}
	
	public Auth(String name, String authority) {
		this.name = name;
		this.authority = authority;
	}
	
	public Auth() {
		
	}
}
