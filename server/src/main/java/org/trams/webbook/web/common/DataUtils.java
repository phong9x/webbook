package org.trams.webbook.web.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class DataUtils {
	
	public static void main (String[] d0){
		System.out.println(getInterestFromJson("{\"interest\":[{\"id\":32,\"name\":\"결제 완료\",\"image\":\"null\"},{\"id\":33,\"name\":\"결제 완료\",\"image\":\"null\"},{\"id\":34,\"name\":\"상담 진행 중\",\"image\":\"null\"}]}"));
	}

	public static String getInterestFromJson(String json){
		String list = "";
		try {
			JSONParser parser = new JSONParser();
 			JSONObject jsonObj = (JSONObject) parser.parse(json);
			Object obj = parser.parse(Utils.toString(jsonObj.get("interest")));
			JSONArray array = (JSONArray)obj;
			
			if(json != null){
				if(array.size() >0){
					for (Object object : array) {
						JSONObject inter = (JSONObject)object; 
						list += ", "+Utils.toString(inter.get("name"));
					}
					return list.substring(1);
				}
			}
		} catch (Exception e) {
		}
		return list;
	}
	public static Map<String,String> parserFollowCounselor(String json){
		Map<String,String> list = new HashMap<>();
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(json);
			Object obj = parser.parse(Utils.toString(jsonObj.get("counselor")));
			JSONArray array = (JSONArray)obj;
			
			if(json != null){
				if(array.size() >0){
					for (Object object : array) {
						JSONObject inter = (JSONObject)object; 
						list.put(Utils.toString(inter.get("id")), Utils.toString(inter.get("id")));
					}
					return list;
				}
				
			}
		} catch (Exception e) {
		}
		return list;
	}
	
	public static List<Integer> parserFollowCounselorList(String json){
		List<Integer> list = new ArrayList<>();
		list.add(0);
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(json);
			Object obj = parser.parse(Utils.toString(jsonObj.get("counselor")));
			JSONArray array = (JSONArray)obj;
			
			if(json != null){
				if(array.size() >0){
					for (Object object : array) {
						JSONObject inter = (JSONObject)object; 
						list.add(Utils.parseInt(inter.get("id")));
						}
					return list;
				}
				
			}
		} catch (Exception e) {
		}
		return list;
	}
	public static List<Integer> parserFollowInterestList(String json){
		List<Integer> list = new ArrayList<>();
		list.add(0);
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(json);
			Object obj = parser.parse(Utils.toString(jsonObj.get("interest")));
			JSONArray array = (JSONArray)obj;
			
			if(json != null){
				if(array.size() >0){
					for (Object object : array) {
						JSONObject inter = (JSONObject)object; 
						list.add(Utils.parseInt(inter.get("id")));
					}
					return list;
				}
				
			}
		} catch (Exception e) {
		}
		return list;
	}
	
	public static String getArrays(String json,String name){
		List<Integer> list = new ArrayList<>();
		list.add(0);
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(json);
			Object obj = parser.parse(Utils.toString(jsonObj.get(name)));
			JSONArray array = (JSONArray)obj;
			
			if(json != null){
				if(array.size() >0){
					return array.toJSONString();
				}
			}
		} catch (Exception e) {
		}
		return "";
	}
}
