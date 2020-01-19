package com.task.manager.app.utils;

import java.util.HashMap;

import com.fasterxml.jackson.databind.ObjectMapper;

public class AppUtils {

	public static String convertMapToStr(HashMap<String, Object> result) {
		String json = null;
		ObjectMapper map = new ObjectMapper();
	 	if (!result.isEmpty()) {
	 		try {
	 			json = map.writeValueAsString(result);
	 		} 
	 		catch (Exception e) {
	 			e.printStackTrace();
	 		}
	 	}
	 	return json;
	} 
}
