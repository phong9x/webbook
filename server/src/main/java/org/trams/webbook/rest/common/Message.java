package org.trams.webbook.rest.common;

public  class Message {

	private Message() {
		// TODO Auto-generated constructor stub
	}
	/*Table User*/
	//USER
	public static final String DUPLICATE_ERROR = "Duplicate User";
	public static final Integer DUPLICATE_ERROR_CODE = 3;
	public static final String CREATE_USER_ERROR = "Create User Fail";
	public static final String CREATE_USER_SUCCESS = "회원가입이 완료되었습니다.";
	
	//LOGIN
	public static final String LOGIN_ERROR = "아이디/비밀번호를 다시 확인해주세요.";
	public static final Integer LOGIN_ERROR_CODE = 1;

	public static final String LOGIN_REQUIRE_MESS = "Login please!";
	public static final Integer LOGIN_REQUIRE_CODE = -1;
	
	
	
	
	
	
	/*Common Exception */
	public static final Integer SUCCESS_CODE=200;
	public static final String SUCCES = "Success";
	public static final String EXCEPTION_ERROR = "Exception error";
	public static final Integer EXCEPTION_ERROR_CODE = 100;
	public static final String LIST_UPDATE_FAIL = "Don't have any update";
	public static final Integer LIST_UPDATE_ZERO_CODE=99;
	
	
	
	/*Accessibility*/
	public static final String CREATE_ACCESSIBILITY_SUCCESS = "Accessibility has creared!";
	
	
	
	/*Category*/
	public static final String CREATE_CATEGORY_SUCCESS = "Category has created!";
	
	
	/*Comment*/
	public static final String 	USER_COMMENT_ERROR = "You has commented in this store!";
	public static final Integer COMMENT_ERROR_CODE = 1;
	public static final String USER_COMMENT_SUCCESS = "Comment success!";
	public static final String COMMENT_LIST_UPDATE_FAIL = "Don't have any comment!";
	
	/*Report*/
	public static final String 	USER_REPORT_ERROR = "You has reported in this store!";
	public static final Integer REPORT_ERROR_CODE = 1;
	public static final String  USER_REPORT_SUCCESS = "Report success!";
	public static final String  REPORT_LIST_UPDATE_FAIL = "Don't have any report!";
	public static final String 	STORE_REPORT_EXIST = "This store have any report!";
	public static final String 	STORE_REPORT_NOT_EXIST = "This store have no report!!";
	/*Intro*/
	public static final String 	INTRO_IMAGE_ERROR = "Don't have intro image!";
	public static final String 	INTRO_IMAGE_SUCCESS= "Have intro image!";
}
