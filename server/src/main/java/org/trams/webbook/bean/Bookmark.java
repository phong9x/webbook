/*
 * Created on 11 Jan 2016 ( Time 16:14:47 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.bean;

import java.io.Serializable;

import javax.validation.constraints.*;

import java.util.Date;

public class Bookmark implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @NotNull
    private Integer userId;

    @NotNull
    private Integer episodeId;


    private Integer isDelete;


    private Date createDate;


    private Date updateDate;


    private Integer episodeName;

    @Size( max = 2147483647 )
    private String nickname;



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
    public void setUserId( Integer userId ) {
        this.userId = userId;
    }
    public Integer getUserId() {
        return this.userId;
    }

    public void setEpisodeId( Integer episodeId ) {
        this.episodeId = episodeId;
    }
    public Integer getEpisodeId() {
        return this.episodeId;
    }

    public void setIsDelete( Integer isDelete ) {
        this.isDelete = isDelete;
    }
    public Integer getIsDelete() {
        return this.isDelete;
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

    public void setEpisodeName( Integer episodeName ) {
        this.episodeName = episodeName;
    }
    public Integer getEpisodeName() {
        return this.episodeName;
    }

    public void setNickname( String nickname ) {
        this.nickname = nickname;
    }
    public String getNickname() {
        return this.nickname;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(userId);
        sb.append("|");
        sb.append(episodeId);
        sb.append("|");
        sb.append(isDelete);
        sb.append("|");
        sb.append(createDate);
        sb.append("|");
        sb.append(updateDate);
        sb.append("|");
        sb.append(episodeName);
        // attribute 'nickname' not usable (type = String Long Text)
        return sb.toString(); 
    } 


}
