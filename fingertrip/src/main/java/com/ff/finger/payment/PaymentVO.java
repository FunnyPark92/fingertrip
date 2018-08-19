package com.ff.finger.payment;

import java.sql.Date;

public class PaymentVO {

	private int paymentNo;
	private Date paymentDate; 
	private String travelstart; 
	private int memberNo; 
	private int courseNo;
	private int winBidNo;
	
	public String getTravelstart() {
		return travelstart;
	}
	public void setTravelstart(String travelstart) {
		this.travelstart = travelstart;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public int getWinBidNo() {
		return winBidNo;
	}
	public void setWinBidNo(int winBidNo) {
		this.winBidNo = winBidNo;
	}
	@Override
	public String toString() {
		return "PaymentVO [paymentNo=" + paymentNo + ", paymentDate=" + paymentDate + ", travelstart=" + travelstart
				+ ", memberNo=" + memberNo + ", courseNo=" + courseNo + ", winBidNo=" + winBidNo + "]";
	}
	
	
	
}
