package com.ff.finger.coupon.model;

public class CouponVO {
	private int couponNo;
	private String couponName;
	
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	
	@Override
	public String toString() {
		return "CouponVO [couponNo=" + couponNo + ", couponName=" + couponName + "]";
	}
	
}
