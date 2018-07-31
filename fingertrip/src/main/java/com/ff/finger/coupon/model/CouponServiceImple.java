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
	
	

}
