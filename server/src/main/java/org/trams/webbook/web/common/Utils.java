package org.trams.webbook.web.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.modelmapper.internal.util.Lists;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;




public class Utils {
	static CharsetEncoder asciiEncoder = Charset.forName("UTF-8").newEncoder();
	
	public static void main(String[] args) {
		System.out.println(getPresentTimeString("yyyyMMdd"));
		
		
	}
	
	public static boolean isUTF8(String s){
	    try{
	        byte[]bytes = s.getBytes("UTF-8");
	    }catch(UnsupportedEncodingException e){
	        e.printStackTrace();
	        System.exit(-1);
	    }
	    return true;
	}
	
	public static boolean isPureAscii(String v) {
	    return asciiEncoder.canEncode(v);
	  }

	
	
	public static Integer parseInt(String str){
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}
	
	public static Integer parseInt(Object obj){
		try {
			return Integer.parseInt(obj.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}
	public static Long parseLong(Object obj){
		try {
			return Long.parseLong(obj.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return (long) 0;
	}
	
	public static String toString(Object str){
		try {
			return String.valueOf(str);
		} catch (Exception e) {
			System.out.println(e.toString());
			return "";
		}
	
	}
	public static String getStringFromArray(String[] str, int index){
		try {
			return String.valueOf(str[index]);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "";
	}
	
	public static Date getPresentTime(String formatDate){
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat(formatDate);
	    java.sql.Date sqlDate = null;
	    sqlDate= java.sql.Date.valueOf(sdf.format(utilDate.getTime()));
	    return sqlDate;
	}
	
	public static String getPresentTimeString(String formatDate){
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat(formatDate);
	    return sdf.format(utilDate.getTime());
	}
	
	public static Date getDate(String formatDate,String startDateString){
	    DateFormat df = new SimpleDateFormat(formatDate); 
	    Date startDate;
	    try {
	        startDate = df.parse(startDateString);
	        return startDate;
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    
	    return null;
	}
	
	
	public static int getHourUtilRentCreate(Calendar dateRent,Calendar dateFire){
		try {
		 
			long milliseconds = dateFire.getTimeInMillis()-dateRent.getTimeInMillis();
			return (int)(milliseconds / (1000*60*60));
		} catch (Exception e) {
		}
		
		return -1;
	}
	
	public static java.sql.Date convertStringtoSqlDate(String date,String formatDate){
		SimpleDateFormat format = new SimpleDateFormat(formatDate);
		java.util.Date parsed = null;
		try {
			parsed = format.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());
	    return sqlDate;
	}
	
	public static java.util.Date convertStringtoUtilDate(String date,String formatDate){
		SimpleDateFormat format = new SimpleDateFormat(formatDate);
		java.util.Date parsed = null;
		try {
			parsed = format.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    return parsed;
	}
	
	/**
	 * 
	 * @param email
	 * @return
	 */
	public static String getFindEmail(String email){
		try {
			String[] e = email.split("@");
			int lenght = e[0].length();
			String rex = e[0].substring(lenght-3, lenght);
			return email.replaceAll(rex, "***");
			
		} catch (Exception e) {
		}
		return "";
	}
	/**
	 * 
	 * @param email
	 * @return
	 */
	public static String getHiddentString(String str,int hiddneNumber){
		try {
			int lenght = str.length();
			String rex = str.substring(lenght-hiddneNumber, lenght);
			return str.replaceAll(rex, "***");
			
		} catch (Exception e) {
		}
		return "";
	}
	/**
	 * 
	 * @param array
	 * @param cement
	 * @return
	 */
	public static <T> String join(T[] array, String cement) {
	    StringBuilder builder = new StringBuilder();

	    try {
		    if(array == null || array.length == 0) {
		        return null;
		    }

		    for (T t : array) {
		        builder.append(t).append(cement);
		    }

		    builder.delete(builder.length() - cement.length(), builder.length());
		} catch (Exception e) {
		}

	    return builder.toString();
	}
	/**
	 * 
	 * @param date
	 * @return
	 */
	public static String getHourMinute(Date date){
		try {
			DateFormat writeFormat = new SimpleDateFormat( "HH시mm분");
			return writeFormat.format( date );
		} catch (Exception e) {
		}
		
		return "";
	}
	public static String getHourMinute(Time time){
		try {
			DateFormat writeFormat = new SimpleDateFormat( "HH:mm");
			return writeFormat.format( time );
		} catch (Exception e) {
		}
		
		return "";
	}
	
	
	/**
	 * 
	 * @param input
	 * @return
	 */
	  public static String getMD5(String input) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            byte[] messageDigest = md.digest(input.getBytes());
	            BigInteger number = new BigInteger(1, messageDigest);
	            String hashtext = number.toString(16);
	            // Now we need to zero pad it if you actually want the full 32 chars.
	            while (hashtext.length() < 32) {
	                hashtext = "0" + hashtext;
	            }
	            return hashtext;
	        }
	        catch (NoSuchAlgorithmException e) {
	            throw new RuntimeException(e);
	        }
	    }
	  
	  /**
	   * 
	   * @param format
	   * @return
	   */
	  public static Date convertToDate(String value,String format){
		  
			SimpleDateFormat formatter = new SimpleDateFormat(format);

			try {

				Date date = formatter.parse(value);
				return date;

			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			return null;
	  }
	  
		/**
		 * Generate autt code
		 * @param email
		 * @param password
		 * @return
		 */
		public static String getAuthPhoneCode(String srt,String str2){
			
			String str = srt+ "ML^#09X#" + str2;
			try {
					String hexStr = getMD5(str);
		            return hexStr.substring(3,9).toUpperCase();			
			} catch (Exception e) {
			}
			return "";
		}
		
		  


		public static String sendMess(String phone, String content) {
			return "0";
		}
		
		public static Cookie createCookie(String cookieName, String cookieValue) {
		    Cookie cookie = new Cookie(cookieName, cookieValue);
		    final int expiryTime = 60 * 60 * 24;  // 24h in seconds
		    cookie.setPath("/");
		    cookie.setMaxAge(expiryTime);
		    cookie.setSecure(true);
		    return cookie;
		}
		
		public static String ConvertInterrestJsonToStringOfName(String json) {
			JSONParser parser = new JSONParser();
			try {
				JSONObject jsonObj = (JSONObject) parser.parse(json);
				JSONArray obj = (JSONArray) parser.parse(Utils.toString(jsonObj.get("interest")));
				String str="";
				int index=1;
				for (Object object : obj) {
					JSONObject item = (JSONObject)object;
					Utils.toString(Utils.toString(item.get("name")));
					if(index==1){
						str+=Utils.toString(Utils.toString(item.get("name")));
					}else{
						str+=", "+Utils.toString(Utils.toString(item.get("name")));
					}
					index++;
					
				}
				return str;
			} catch (Exception e) {
				System.out.println(e);
				return "";
			}
			
		}
		public static String ConvertJsonTo_String(String json,String objectName, String atributeName) {
			JSONParser parser = new JSONParser();
			try {
				JSONObject jsonObj = (JSONObject) new JSONParser().parse(json);
				JSONArray obj = (JSONArray) jsonObj.get(objectName);
				String str="";
				int index=0;
				for (Object object : obj) {
					JSONObject item = (JSONObject)object;
					Utils.toString(Utils.toString(item.get(atributeName)));
					if(index==0){
						str+=Utils.toString(Utils.toString(item.get(atributeName)));
					}else{
						str+=", "+Utils.toString(Utils.toString(item.get(atributeName)));
					}
					index++;
					
				}
				return str;
			} catch (Exception e) {
				System.out.println(e);
				return "";
			}
			
		}
		
		public static List<String> ConvertJsonTo_ListString(String json,String atributeName) {
			JSONParser parser = new JSONParser();
			try {
				JSONObject jsonObj = (JSONObject) new JSONParser().parse(json);
				JSONArray msg = (JSONArray) jsonObj.get(atributeName);
				Iterator<String> iterator = msg.iterator();
				List<String> str=new ArrayList<>();
				int index=0;
				while (iterator.hasNext()) {
					str.add(iterator.next());
				}
				return str;
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
		}
		
	
		public static Map<String,Object> convertJsonArrayToMap(String jsonarray) {
			try {
				Map<String,Object> listData = new HashMap<String,Object>();
				
				JSONObject jsonObj = (JSONObject) new JSONParser().parse("{\"data\":"+jsonarray+"}");
				JSONArray objParent = (JSONArray) jsonObj.get("data");
				for (Object object : objParent) {
					listData.put(object.toString(), object);
				}
				return listData;
			} catch (Exception e) {
				System.out.println(e);
				return null;
			}
			
		}
	
		
		 public static String convertStringListToJson(List<Integer> list){
			 JSONArray listData = new JSONArray();
			 if(list != null && list.size() > 0){
				 for (int i = 0; i < list.size(); i++) {
					 listData.add(list.get(i));
				 }
			 }
			 return listData.toJSONString();
		 }
		 public static String convertMapToJson(Map<String,Object>  list){
			 JSONArray listData = new JSONArray();
			 
			 List<Object> listD = new ArrayList<Object>(list.values());
			 
			 if(list != null && listD.size() > 0){
				 for (int i = 0; i < listD.size(); i++) {
					 listData.add(listD.get(i));
				 }
			 }
			 return listData.toJSONString();
		 }
		 public static String ConvertStringListToJsonObjectContain_ID_Name(String[] listString,String objectName){
			 JSONObject parent = new JSONObject();
			 JSONArray list = new JSONArray();
			 List<String> listId = new ArrayList<>();
			 List<String> listName = new ArrayList<>();
			 
			 for (int i = 0; i < listString.length; i++) {
				 String[] split=listString[i].split("-");
				 JSONObject obj = new JSONObject();
				 obj.put( objectName+"_id",split[0].toString());
				 obj.put( objectName+"_name",split[1].toString());
				 list.add(obj); 
			}
			parent.put(objectName, list);
			
			 return parent.toJSONString();
		 }
		 
		 public static String ConvertStringListToAddressStore(String[] listString){
			 JSONObject parent = new JSONObject();
			 JSONArray list = new JSONArray();
			 List<String> listId = new ArrayList<>();
			 List<String> listName = new ArrayList<>();
			 JSONObject obj = new JSONObject();
			 obj.put( "address1",listString[0].toString());
			 obj.put( "address2",listString[1].toString());
			 list.add(obj); 
			 
			 parent.put("address", list);
			 return parent.toJSONString();
		 }
	
		 public static <T> String ConvertListToJson(String name,List<T> listString){
			 JSONObject obj = new JSONObject();
			 JSONArray list = new JSONArray();
			 if(listString != null){
				 for (T object : listString) {
					 list.add(object);
				}
			 }
			 obj.put( name,list);
			 return obj.toJSONString();
		 }
		 
		
		 public static Long convertFromTime(Date date){
			 try {
				return date.getTime();
			} catch (Exception e) {
			}
			 
			 return new Long(0);
		 }
		 public static String formatPhoneNumber(String str){
			 String temp="";
			 Integer a= (Integer)str.length()/4;
			 Integer b= str.length()-(a)*4;
			 int index=0;
			 for (int i = a; i >=0; i--) {
				 if(i==a){
					 temp=str.substring(str.length()-(index*4+4), str.length()-index*4)+temp;
				 }else if(i==0){
					 temp=str.substring(0, b)+"-"+temp;
				 }else{
					 temp=str.substring(str.length()-(index*4+4), str.length()-index*4)+"-"+temp;
				 }
				 index++;
				 
			}
			 
			 return temp;
		 }
		 
		 public static Integer diffirentTwoDate(Date beforeDate,Date afterDate){
			 try {
				 long diff = afterDate.getTime()-beforeDate.getTime();
				 
				 Integer diffDays = Math.round(Utils.parseLong(diff) / (24 * 60 * 60 * 1000));
				return diffDays;
			} catch (Exception e) {
			}
			 
			 return 0;
		 }
		 
		
		 
}
