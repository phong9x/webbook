/*
 * Created on 26 Feb 2016 ( Time 19:07:19 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
// This Bean has a basic Primary Key (not composite) 

package org.trams.webbook.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;

import java.util.Date;

import javax.persistence.*;

/**
 * Persistent class for entity stored in table "coupon_purchase"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="coupon_purchase", catalog="webbook" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="CouponPurchaseEntity.countAll", query="SELECT COUNT(x) FROM CouponPurchaseEntity x" )
} )
public class CouponPurchaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="_id", nullable=false)
    private Integer    id           ;


    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Column(name="CHARGE_AMOUNT")
    private Integer    chargeAmount ;

    @Column(name="TOTAL_FEE")
    private Double     totalFee     ;

    @Column(name="PAYMENT_METHOD_ID")
    private Integer    paymentMethodId ;

    @Column(name="PAYMENT_METHOD_NAME", length=200)
    private String     paymentMethodName ;

    @Column(name="TID")
    private String     tid          ;

    @Column(name="CANCEL_REASON", length=300)
    private String     cancelReason ;

    @Column(name="CANCEL_CODE", length=300)
    private String     cancelCode   ;

    @Column(name="STATUS")
    private Integer    status       ;

    @Column(name="IS_DELETE")
    private Integer    isDelete     ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="CREATE_DATE")
    private Date       createDate   ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="UPDATE_DATE")
    private Date       updateDate   ;

	// "userId" (column "USER_ID") is not defined by itself because used as FK in a link 


    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------
    @ManyToOne
    @JoinColumn(name="USER_ID", referencedColumnName="_id")
    private UserEntity user        ;


    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public CouponPurchaseEntity() {
		super();
    }
    
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
    //--- DATABASE MAPPING : CHARGE_AMOUNT ( INT ) 
    public void setChargeAmount( Integer chargeAmount ) {
        this.chargeAmount = chargeAmount;
    }
    public Integer getChargeAmount() {
        return this.chargeAmount;
    }

    //--- DATABASE MAPPING : TOTAL_FEE ( DOUBLE ) 
    public void setTotalFee( Double totalFee ) {
        this.totalFee = totalFee;
    }
    public Double getTotalFee() {
        return this.totalFee;
    }

    //--- DATABASE MAPPING : PAYMENT_METHOD_ID ( INT ) 
    public void setPaymentMethodId( Integer paymentMethodId ) {
        this.paymentMethodId = paymentMethodId;
    }
    public Integer getPaymentMethodId() {
        return this.paymentMethodId;
    }

    //--- DATABASE MAPPING : PAYMENT_METHOD_NAME ( VARCHAR ) 
    public void setPaymentMethodName( String paymentMethodName ) {
        this.paymentMethodName = paymentMethodName;
    }
    public String getPaymentMethodName() {
        return this.paymentMethodName;
    }

    //--- DATABASE MAPPING : TID ( TEXT ) 
    public void setTid( String tid ) {
        this.tid = tid;
    }
    public String getTid() {
        return this.tid;
    }

    //--- DATABASE MAPPING : CANCEL_REASON ( VARCHAR ) 
    public void setCancelReason( String cancelReason ) {
        this.cancelReason = cancelReason;
    }
    public String getCancelReason() {
        return this.cancelReason;
    }

    //--- DATABASE MAPPING : CANCEL_CODE ( VARCHAR ) 
    public void setCancelCode( String cancelCode ) {
        this.cancelCode = cancelCode;
    }
    public String getCancelCode() {
        return this.cancelCode;
    }

    //--- DATABASE MAPPING : STATUS ( INT ) 
    public void setStatus( Integer status ) {
        this.status = status;
    }
    public Integer getStatus() {
        return this.status;
    }

    //--- DATABASE MAPPING : IS_DELETE ( INT ) 
    public void setIsDelete( Integer isDelete ) {
        this.isDelete = isDelete;
    }
    public Integer getIsDelete() {
        return this.isDelete;
    }

    //--- DATABASE MAPPING : CREATE_DATE ( DATETIME ) 
    public void setCreateDate( Date createDate ) {
        this.createDate = createDate;
    }
    public Date getCreateDate() {
        return this.createDate;
    }

    //--- DATABASE MAPPING : UPDATE_DATE ( DATETIME ) 
    public void setUpdateDate( Date updateDate ) {
        this.updateDate = updateDate;
    }
    public Date getUpdateDate() {
        return this.updateDate;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------
    public void setUser( UserEntity user ) {
        this.user = user;
    }
    public UserEntity getUser() {
        return this.user;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(id);
        sb.append("]:"); 
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
