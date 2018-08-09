package com.ff.finger.coupon.model;

public class CouponListVO {
	
	private int couponListNo;
	private int heartNo;
	private int couponNo;
	
	public int getCouponListNo() {
		return couponListNo;
	}
	public void setCouponListNo(int couponListNo) {
		this.couponListNo = couponListNo;
	}
	public int getHeartNo() {
		return heartNo;
	}
	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	
	@Override
	public String toString() {
		return "CouponListVO [couponListNo=" + couponListNo + ", heartNo=" + heartNo + ", couponNo=" + couponNo + "]";
	}
	
}
