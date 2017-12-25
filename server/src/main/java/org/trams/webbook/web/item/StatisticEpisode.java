package org.trams.webbook.web.item;

public class StatisticEpisode {
private Integer totalEpisode;
private Integer totalNewEpisode;
private Integer totalEpisodeRecentWork;
private Integer totalSumHitNumber;
private Integer totalEpisodeCharge;
private Integer totalEpisodePurchase;
private Integer totalNewEpisodePurchase;

public StatisticEpisode() {
	super();
	this.totalEpisode = 0;
	this.totalNewEpisode = 0;
	this.totalSumHitNumber = 0;
	this.totalEpisodeCharge = 0;
	this.totalEpisodePurchase = 0;
	this.totalNewEpisodePurchase = 0;
	this.totalEpisodeRecentWork = 0;
}
public StatisticEpisode(Integer totalEpisode, Integer totalNewEpisode, Integer totalSumHitNumber,
		Integer totalEpisodeCharge, Integer totalEpisodePurchase, Integer totalNewEpisodePurchase,Integer totalEpisodeRecentWork) {
	super();
	this.totalEpisode = totalEpisode;
	this.totalNewEpisode = totalNewEpisode;
	this.totalSumHitNumber = totalSumHitNumber;
	this.totalEpisodeCharge = totalEpisodeCharge;
	this.totalEpisodePurchase = totalEpisodePurchase;
	this.totalNewEpisodePurchase = totalNewEpisodePurchase;
	this.totalEpisodeRecentWork = totalEpisodeRecentWork;
}

public Integer getTotalEpisodeRecentWork() {
	return totalEpisodeRecentWork;
}
public void setTotalEpisodeRecentWork(Integer totalEpisodeRecentWork) {
	this.totalEpisodeRecentWork = totalEpisodeRecentWork;
}
public Integer getTotalEpisode() {
	return totalEpisode;
}
public void setTotalEpisode(Integer totalEpisode) {
	this.totalEpisode = totalEpisode;
}
public Integer getTotalNewEpisode() {
	return totalNewEpisode;
}
public void setTotalNewEpisode(Integer totalNewEpisode) {
	this.totalNewEpisode = totalNewEpisode;
}
public Integer getTotalSumHitNumber() {
	return totalSumHitNumber;
}
public void setTotalSumHitNumber(Integer totalSumHitNumber) {
	this.totalSumHitNumber = totalSumHitNumber;
}
public Integer getTotalEpisodeCharge() {
	return totalEpisodeCharge;
}
public void setTotalEpisodeCharge(Integer totalEpisodeCharge) {
	this.totalEpisodeCharge = totalEpisodeCharge;
}
public Integer getTotalEpisodePurchase() {
	return totalEpisodePurchase;
}
public void setTotalEpisodePurchase(Integer totalEpisodePurchase) {
	this.totalEpisodePurchase = totalEpisodePurchase;
}
public Integer getTotalNewEpisodePurchase() {
	return totalNewEpisodePurchase;
}
public void setTotalNewEpisodePurchase(Integer totalNewEpisodePurchase) {
	this.totalNewEpisodePurchase = totalNewEpisodePurchase;
}


}
