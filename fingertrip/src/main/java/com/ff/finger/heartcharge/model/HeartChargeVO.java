package com.ff.finger.heartcharge.model;

import java.sql.Timestamp;

public class HeartChargeVO {
	private int heartChargeNo; /* 하트충전번호 NOT NULL*/
	private int heartChargeCount; /* 충전개수 NOT NULL*/
	private int heartChargePay; /* 충전금액 NOT NULL*/
	private Timestamp heartChargeDay; /* 충전일 DEFAULT SYSDATE*/
	private int memberNo; /* 회원번호 NOT NULL*/
	
	public int getHeartChargeNo() {
		return heartChargeNo;
	}
	public void setHeartChargeNo(int heartChargeNo) {
		this.heartChargeNo = heartChargeNo;
	}
	public int getHeartChargeCount() {
		return heartChargeCount;
	}
	public void setHeartChargeCount(int heartChargeCount) {
		this.heartChargeCount = heartChargeCount;
	}
	public int getHeartChargePay() {
		return heartChargePay;
	}
	public void setHeartChargePay(int heartChargePay) {
		this.heartChargePay = heartChargePay;
	}
	public Timestamp getHeartChargeDay() {
		return heartChargeDay;
	}
	public void setHeartChargeDay(Timestamp heartChargeDay) {
		this.heartChargeDay = heartChargeDay;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "HeartChargeVO [heartChargeNo=" + heartChargeNo + ", heartChargeCount=" + heartChargeCount
				+ ", heartChargePay=" + heartChargePay + ", heartChargeDay=" + heartChargeDay + ", memberNo=" + memberNo
				+ "]";
	}
	
}
