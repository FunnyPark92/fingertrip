package com.ff.finger.bid.model;

import java.sql.Timestamp;

public class BidVO {
	private int bidNo;
	private int bidPrice;
	private Timestamp bidDay;
	private Timestamp tripStartDay1;
	private Timestamp tripStartDay2;
	private Timestamp tripStartDay3;
	private Timestamp tripStartDay4;
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
	public Timestamp getBidDay() {
		return bidDay;
	}
	public void setBidDay(Timestamp bidDay) {
		this.bidDay = bidDay;
	}
	public Timestamp getTripStartDay1() {
		return tripStartDay1;
	}
	public void setTripStartDay1(Timestamp tripStartDay1) {
		this.tripStartDay1 = tripStartDay1;
	}
	public Timestamp getTripStartDay2() {
		return tripStartDay2;
	}
	public void setTripStartDay2(Timestamp tripStartDay2) {
		this.tripStartDay2 = tripStartDay2;
	}
	public Timestamp getTripStartDay3() {
		return tripStartDay3;
	}
	public void setTripStartDay3(Timestamp tripStartDay3) {
		this.tripStartDay3 = tripStartDay3;
	}
	public Timestamp getTripStartDay4() {
		return tripStartDay4;
	}
	public void setTripStartDay4(Timestamp tripStartDay4) {
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
