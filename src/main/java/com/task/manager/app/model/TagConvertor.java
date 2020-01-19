package com.task.manager.app.model;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class TagConvertor implements AttributeConverter<Set<String>, String>{

	@Override
	public String convertToDatabaseColumn(Set<String> noteTags) {
		String tags = null;
		if(noteTags != null && !noteTags.isEmpty()) {
			tags = String.join(",", noteTags);
		}
		return tags;
	}

	@Override
	public Set<String> convertToEntityAttribute(String tags) {
		if(tags !=null && !tags.trim().isEmpty()) {
			return new HashSet<String>(Arrays.asList(tags.split(",")));
		}
		else return null;
	}
}
