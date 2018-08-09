package com.ff.finger.coupon.model;

import java.util.List;
import java.util.Map;

public interface CouponService {

	public List<Map<String , Object>> selectCouponView(String id);
	public int selectByHeart(int heartNo);
	public List<Map<String , Object>> selectHeartMemberCoupon(Map<String , Object> map);
	public List<CouponVO> selectAll();
	public int offerCoupon(Map<String , Object> map);
}
