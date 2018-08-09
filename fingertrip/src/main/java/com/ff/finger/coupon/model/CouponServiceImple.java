package com.ff.finger.coupon.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImple implements CouponService {
	
	@Autowired
	private CouponDAO couponDao;

	@Override
	public List<Map<String, Object>> selectCouponView(String id) {
		return couponDao.selectCouponView(id);
	}

	@Override
	public int selectByHeart(int heartNo) {
		return couponDao.selectByHeart(heartNo);
	}

	@Override
	public List<Map<String, Object>> selectHeartMemberCoupon(int courseNo) {
		return couponDao.selectHeartMemberCoupon(courseNo);
	}

	@Override
	public List<CouponVO> selectAll() {
		return couponDao.selectAll();
	}
	
}
