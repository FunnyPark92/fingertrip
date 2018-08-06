package com.ff.finger.heart.model;

public class HeartVO{
	private int heartNo;
	private int courseNo;
	private int memberNo;

	public int getHeartNo() {
		return heartNo;
	}
	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "HeartVO [heartNo=" + heartNo + ", courseNo=" + courseNo + ", memberNo=" + memberNo + "]";
	}
	
}
