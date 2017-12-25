/*
 * Created on 26 Feb 2016 ( Time 19:07:13 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.bean;

import java.io.Serializable;

import javax.validation.constraints.*;

import java.util.Date;

public class CouponPurchase implements Serializable {

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


    private Integer chargeAmount;


    private Double totalFee;


    private Integer paymentMethodId;

    @Size( max = 200 )
    private String paymentMethodName;

    @Size( max = 65535 )
    private String tid;

    @Size( max = 300 )
    private String cancelReason;

    @Size( max = 300 )
    private String cancelCode;


    private Integer status;


    private Integer isDelete;


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
    public void setUserId( Integer userId ) {
        this.userId = userId;
    }
    public Integer getUserId() {
        return this.userId;
    }

    public void setChargeAmount( Integer chargeAmount ) {
        this.chargeAmount = chargeAmount;
    }
    public Integer getChargeAmount() {
        return this.chargeAmount;
    }

    public void setTotalFee( Double totalFee ) {
        this.totalFee = totalFee;
    }
    public Double getTotalFee() {
        return this.totalFee;
    }

    public void setPaymentMethodId( Integer paymentMethodId ) {
        this.paymentMethodId = paymentMethodId;
    }
    public Integer getPaymentMethodId() {
        return this.paymentMethodId;
    }

    public void setPaymentMethodName( String paymentMethodName ) {
        this.paymentMethodName = paymentMethodName;
    }
    public String getPaymentMethodName() {
        return this.paymentMethodName;
    }

    public void setTid( String tid ) {
        this.tid = tid;
    }
    public String getTid() {
        return this.tid;
    }

    public void setCancelReason( String cancelReason ) {
        this.cancelReason = cancelReason;
    }
    public String getCancelReason() {
        return this.cancelReason;
    }

    public void setCancelCode( String cancelCode ) {
        this.cancelCode = cancelCode;
    }
    public String getCancelCode() {
        return this.cancelCode;
    }

    public void setStatus( Integer status ) {
        this.status = status;
    }
    public Integer getStatus() {
        return this.status;
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
        sb.append(chargeAmount);
        sb.append("|");
        sb.append(totalFee);
        sb.append("|");
        sb.append(paymentMethodId);
        sb.append("|");
        sb.append(paymentMethodName);
        // attribute 'tid' not usable (type = String Long Text)
        sb.append("|");
        sb.append(cancelReason);
        sb.append("|");
        sb.append(cancelCode);
        sb.append("|");
        sb.append(status);
        sb.append("|");
        sb.append(isDelete);
        sb.append("|");
        sb.append(createDate);
        sb.append("|");
        sb.append(updateDate);
        return sb.toString(); 
    } 


}
