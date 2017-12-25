package org.trams.webbook.web.item;

public class StatisticCoupon {
private Integer totalCouponChargingNumber;
private Integer totalRecentCouponChargingNumber ;
private Integer totalCouponChargingAmount ;
private Integer totalRecentCouponChargingAmount ;

public StatisticCoupon() {
	super();
	this.totalCouponChargingNumber = 0;
	this.totalRecentCouponChargingNumber = 0;
	this.totalCouponChargingAmount = 0;
	this.totalRecentCouponChargingAmount = 0;
}
public StatisticCoupon(Integer totalCouponChargingNumber, Integer totalRecentCouponChargingNumber,
		Integer totalCouponChargingAmount, Integer totalRecentCouponChargingAmount) {
	super();
	this.totalCouponChargingNumber = totalCouponChargingNumber;
	this.totalRecentCouponChargingNumber = totalRecentCouponChargingNumber;
	this.totalCouponChargingAmount = totalCouponChargingAmount;
	this.totalRecentCouponChargingAmount = totalRecentCouponChargingAmount;
}
public Integer getTotalCouponChargingNumber() {
	return totalCouponChargingNumber;
}
public void setTotalCouponChargingNumber(Integer totalCouponChargingNumber) {
	this.totalCouponChargingNumber = totalCouponChargingNumber;
}
public Integer getTotalRecentCouponChargingNumber() {
	return totalRecentCouponChargingNumber;
}
public void setTotalRecentCouponChargingNumber(Integer totalRecentCouponChargingNumber) {
	this.totalRecentCouponChargingNumber = totalRecentCouponChargingNumber;
}
public Integer getTotalCouponChargingAmount() {
	return totalCouponChargingAmount;
}
public void setTotalCouponChargingAmount(Integer totalCouponChargingAmount) {
	this.totalCouponChargingAmount = totalCouponChargingAmount;
}
public Integer getTotalRecentCouponChargingAmount() {
	return totalRecentCouponChargingAmount;
}
public void setTotalRecentCouponChargingAmount(Integer totalRecentCouponChargingAmount) {
	this.totalRecentCouponChargingAmount = totalRecentCouponChargingAmount;
}
}
