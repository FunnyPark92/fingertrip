package com.ff.finger.coupon.model;

import java.util.List;
import java.util.Map;

public interface CouponService {

	public List<Map<String , Object>> selectCouponView(String id);
	public int selectByHeart(int heartNo);
	public List<Map<String , Object>> selectHeartMemberCoupon(int courseNo);
	public List<CouponVO> selectAll();
}
