package com.task.manager.app.model;

import java.util.Set;

import javax.persistence.Convert;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "NOTES")
public class Note extends BaseEntity {

	private String title;
	
	@Lob
	private String content;
	
	@Convert(converter = TagConvertor.class)
	private Set<String> tags;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	

	public Set<String> getTags() {
		return tags;
	}

	public void setTags(Set<String> tags) {
		this.tags = tags;
	}

	@Embedded
	public EntityCommonData commonData;
	
	public EntityCommonData getCommonData() {
		return commonData;
	}

	public void setCommonData(EntityCommonData commonData) {
		this.commonData = commonData;
	}

	public Note(String title, String content, Set<String> tags, Long createdBy) {
		this.title = title;
		this.content = content;
		this.tags = tags;
	}
	
	public Note(String title, String content, Set<String> tags) {
		this.title = title;
		this.content = content;
		this.tags = tags;
	}
	
	public Note() {
		//
	}
}
