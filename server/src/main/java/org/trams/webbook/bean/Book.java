/*
 * Created on 16 Feb 2016 ( Time 10:21:50 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.bean;

import java.io.Serializable;

import javax.validation.constraints.*;

import java.util.Date;

public class Book implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    

    private Integer userId;

    @Size( max = 300 )
    private String title;


    private Integer genreId;

    @Size( max = 300 )
    private String genreName;

    @Size( max = 20 )
    private String adult;

    @Size( max = 300 )
    private String dayOfWeek;


    private Integer ageGroupId;

    @Size( max = 100 )
    private String ageGroupName;


    private Integer leagueId;

    @Size( max = 100 )
    private String leagueName;

    @Size( max = 300 )
    private String introduce;

    @Size( max = 300 )
    private String coverImage;


    private Integer episodeNumber;


    private Integer hitsNo;


    private Integer interestedBookNo;


    private Integer recommendationNo;


    private Integer hitsWeekly;


    private Integer interestedWeekly;


    private Integer recommendationWeekly;

    @Size( max = 100 )
    private String keyword1;

    @Size( max = 100 )
    private String keyword2;

    @Size( max = 100 )
    private String keyword3;

    @Size( max = 100 )
    private String keyword4;

    @NotNull
    private Integer comeplete;

    @NotNull
    private Integer isDelete;

    @NotNull
    private Date createDate;

    @NotNull
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
    public void setUserId( Integer userId ) {
        this.userId = userId;
    }
    public Integer getUserId() {
        return this.userId;
    }

    public void setTitle( String title ) {
        this.title = title;
    }
    public String getTitle() {
        return this.title;
    }

    public void setGenreId( Integer genreId ) {
        this.genreId = genreId;
    }
    public Integer getGenreId() {
        return this.genreId;
    }

    public void setGenreName( String genreName ) {
        this.genreName = genreName;
    }
    public String getGenreName() {
        return this.genreName;
    }

    public void setAdult( String adult ) {
        this.adult = adult;
    }
    public String getAdult() {
        return this.adult;
    }

    public void setDayOfWeek( String dayOfWeek ) {
        this.dayOfWeek = dayOfWeek;
    }
    public String getDayOfWeek() {
        return this.dayOfWeek;
    }

    public void setAgeGroupId( Integer ageGroupId ) {
        this.ageGroupId = ageGroupId;
    }
    public Integer getAgeGroupId() {
        return this.ageGroupId;
    }

    public void setAgeGroupName( String ageGroupName ) {
        this.ageGroupName = ageGroupName;
    }
    public String getAgeGroupName() {
        return this.ageGroupName;
    }

    public void setLeagueId( Integer leagueId ) {
        this.leagueId = leagueId;
    }
    public Integer getLeagueId() {
        return this.leagueId;
    }

    public void setLeagueName( String leagueName ) {
        this.leagueName = leagueName;
    }
    public String getLeagueName() {
        return this.leagueName;
    }

    public void setIntroduce( String introduce ) {
        this.introduce = introduce;
    }
    public String getIntroduce() {
        return this.introduce;
    }

    public void setCoverImage( String coverImage ) {
        this.coverImage = coverImage;
    }
    public String getCoverImage() {
        return this.coverImage;
    }

    public void setEpisodeNumber( Integer episodeNumber ) {
        this.episodeNumber = episodeNumber;
    }
    public Integer getEpisodeNumber() {
        return this.episodeNumber;
    }

    public void setHitsNo( Integer hitsNo ) {
        this.hitsNo = hitsNo;
    }
    public Integer getHitsNo() {
        return this.hitsNo;
    }

    public void setInterestedBookNo( Integer interestedBookNo ) {
        this.interestedBookNo = interestedBookNo;
    }
    public Integer getInterestedBookNo() {
        return this.interestedBookNo;
    }

    public void setRecommendationNo( Integer recommendationNo ) {
        this.recommendationNo = recommendationNo;
    }
    public Integer getRecommendationNo() {
        return this.recommendationNo;
    }

    public void setHitsWeekly( Integer hitsWeekly ) {
        this.hitsWeekly = hitsWeekly;
    }
    public Integer getHitsWeekly() {
        return this.hitsWeekly;
    }

    public void setInterestedWeekly( Integer interestedWeekly ) {
        this.interestedWeekly = interestedWeekly;
    }
    public Integer getInterestedWeekly() {
        return this.interestedWeekly;
    }

    public void setRecommendationWeekly( Integer recommendationWeekly ) {
        this.recommendationWeekly = recommendationWeekly;
    }
    public Integer getRecommendationWeekly() {
        return this.recommendationWeekly;
    }

    public void setKeyword1( String keyword1 ) {
        this.keyword1 = keyword1;
    }
    public String getKeyword1() {
        return this.keyword1;
    }

    public void setKeyword2( String keyword2 ) {
        this.keyword2 = keyword2;
    }
    public String getKeyword2() {
        return this.keyword2;
    }

    public void setKeyword3( String keyword3 ) {
        this.keyword3 = keyword3;
    }
    public String getKeyword3() {
        return this.keyword3;
    }

    public void setKeyword4( String keyword4 ) {
        this.keyword4 = keyword4;
    }
    public String getKeyword4() {
        return this.keyword4;
    }

    public void setComeplete( Integer comeplete ) {
        this.comeplete = comeplete;
    }
    public Integer getComeplete() {
        return this.comeplete;
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


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(userId);
        sb.append("|");
        sb.append(title);
        sb.append("|");
        sb.append(genreId);
        sb.append("|");
        sb.append(genreName);
        sb.append("|");
        sb.append(adult);
        sb.append("|");
        sb.append(dayOfWeek);
        sb.append("|");
        sb.append(ageGroupId);
        sb.append("|");
        sb.append(ageGroupName);
        sb.append("|");
        sb.append(leagueId);
        sb.append("|");
        sb.append(leagueName);
        sb.append("|");
        sb.append(introduce);
        sb.append("|");
        sb.append(coverImage);
        sb.append("|");
        sb.append(episodeNumber);
        sb.append("|");
        sb.append(hitsNo);
        sb.append("|");
        sb.append(interestedBookNo);
        sb.append("|");
        sb.append(recommendationNo);
        sb.append("|");
        sb.append(hitsWeekly);
        sb.append("|");
        sb.append(interestedWeekly);
        sb.append("|");
        sb.append(recommendationWeekly);
        sb.append("|");
        sb.append(keyword1);
        sb.append("|");
        sb.append(keyword2);
        sb.append("|");
        sb.append(keyword3);
        sb.append("|");
        sb.append(keyword4);
        sb.append("|");
        sb.append(comeplete);
        sb.append("|");
        sb.append(isDelete);
        sb.append("|");
        sb.append(createDate);
        sb.append("|");
        sb.append(updateDate);
        return sb.toString(); 
    } 


}
