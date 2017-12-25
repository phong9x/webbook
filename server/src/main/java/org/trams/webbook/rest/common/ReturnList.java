package org.trams.webbook.rest.common;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;

public class ReturnList {
	public List<T> value=null;
    public String message="";
    public Integer code=200;

    public void ReturningValue(List<T> value, String message,Integer code) {
        this.value = value;
        this.message = message;
        this.code = code;
    }
    public void ReturningObject(List<T> value)
    {
    	this.value = value;
        this.code =200;
        this.message="success";
    	
    }
    public void ReturningString(String message,Integer code)
    {
    	this.message = message;
    	this.code = code;
        value=null;
    }
    public void ReturningException()
    {
    	message = Message.EXCEPTION_ERROR;
    	code = Message.EXCEPTION_ERROR_CODE;
        value=null;
    }
}
