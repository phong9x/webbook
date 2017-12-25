package org.trams.webbook.rest.item;

public class ReturnObjectData<T>{
	
	public int code;
	public String message;
	public T data;
	
	public ReturnObjectData(int code,String message,T data){
		this.data = data;
		this.code = code;
		this.message = message;
	} 
	public ReturnObjectData(int code,String message){
		this.data = null; 
		this.code = code;
		this.message = message;
	} 


	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
 
}
