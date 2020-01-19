package com.task.manager.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class EntityCommonData {

	@Column(name = "CREATED_ON")
	private Date createdOn;
	
	@Column(name = "MODIFIED_ON")
	private Date modifiedOn;
	
	@Column(name = "CREATED_BY")
	private Long createdBy;
}
