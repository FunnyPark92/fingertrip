package com.ff.finger.bid.model;

import java.sql.Date;

public class BidVO {
	private int bidNo;
	private int bidPrice;
	private Date bidDay;
	private Date tripStartDay1;
	private Date tripStartDay2;
	private Date tripStartDay3;
	private Date tripStartDay4;
	private int travelAgencyNo;
	private int courseNo;
	
	public int getBidNo() {
		return bidNo;
	}
	public void setBidNo(int bidNo) {
		this.bidNo = bidNo;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public Date getBidDay() {
		return bidDay;
	}
	public void setBidDay(Date bidDay) {
		this.bidDay = bidDay;
	}
	public Date getTripStartDay1() {
		return tripStartDay1;
	}
	public void setTripStartDay1(Date tripStartDay1) {
		this.tripStartDay1 = tripStartDay1;
	}
	public Date getTripStartDay2() {
		return tripStartDay2;
	}
	public void setTripStartDay2(Date tripStartDay2) {
		this.tripStartDay2 = tripStartDay2;
	}
	public Date getTripStartDay3() {
		return tripStartDay3;
	}
	public void setTripStartDay3(Date tripStartDay3) {
		this.tripStartDay3 = tripStartDay3;
	}
	public Date getTripStartDay4() {
		return tripStartDay4;
	}
	public void setTripStartDay4(Date tripStartDay4) {
		this.tripStartDay4 = tripStartDay4;
	}
	public int getTravelAgencyNo() {
		return travelAgencyNo;
	}
	public void setTravelAgencyNo(int travelAgencyNo) {
		this.travelAgencyNo = travelAgencyNo;
	}
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	
	@Override
	public String toString() {
		return "BidVO [bidNo=" + bidNo + ", bidPrice=" + bidPrice + ", bidDay=" + bidDay + ", tripStartDay1="
				+ tripStartDay1 + ", tripStartDay2=" + tripStartDay2 + ", tripStartDay3=" + tripStartDay3
				+ ", tripStartDay4=" + tripStartDay4 + ", travelAgencyNo=" + travelAgencyNo + ", courseNo=" + courseNo
				+ "]";
	}

}
