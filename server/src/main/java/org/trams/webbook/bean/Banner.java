/*
 * Created on 11 Jan 2016 ( Time 16:14:47 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.bean;

import java.io.Serializable;

import javax.validation.constraints.*;

import java.util.Date;

public class Banner implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Size( max = 500 )
    private String banner1;

    @Size( max = 500 )
    private String banner2;

    @Size( max = 500 )
    private String banner3;


    private Date createDate;


    private Date updateDate;



    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------
    public void setId( Integer id ) {
        this.id = id ;
    }

    public Integer getId() {
        return this.id;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    public void setBanner1( String banner1 ) {
        this.banner1 = banner1;
    }
    public String getBanner1() {
        return this.banner1;
    }

    public void setBanner2( String banner2 ) {
        this.banner2 = banner2;
    }
    public String getBanner2() {
        return this.banner2;
    }

    public void setBanner3( String banner3 ) {
        this.banner3 = banner3;
    }
    public String getBanner3() {
        return this.banner3;
    }

    public void setCreateDate( Date createDate ) {
        this.createDate = createDate;
    }
    public Date getCreateDate() {
        return this.createDate;
    }

    public void setUpdateDate( Date updateDate ) {
        this.updateDate = updateDate;
    }
    public Date getUpdateDate() {
        return this.updateDate;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(banner1);
        sb.append("|");
        sb.append(banner2);
        sb.append("|");
        sb.append(banner3);
        sb.append("|");
        sb.append(createDate);
        sb.append("|");
        sb.append(updateDate);
        return sb.toString(); 
    } 


}
