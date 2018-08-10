package com.ff.finger.heartlist.model;

public class HeartListVO {
	private int heartListNo; /* 하트내역번호 NOT NULL*/
	private String status; /* 상태 NOT NULL*/
	private int heartNo; /* 하트번호 */
	private int heartChargeNo; /* 하트충전번호 */
	private int memberNo; /* 회원번호 NOT NULL*/
	
	public int getHeartListNo() {
		return heartListNo;
	}
	public void setHeartListNo(int heartListNo) {
		this.heartListNo = heartListNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getHeartNo() {
		return heartNo;
	}
	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}
	public int getHeartChargeNo() {
		return heartChargeNo;
	}
	public void setHeartChargeNo(int heartChargeNo) {
		this.heartChargeNo = heartChargeNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "HeartListVO [heartListNo=" + heartListNo + ", status=" + status + ", heartNo=" + heartNo
				+ ", heartChargeNo=" + heartChargeNo + ", memberNo=" + memberNo + "]";
	}
	
}
