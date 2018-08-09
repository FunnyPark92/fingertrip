package com.ff.finger.coupon.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.heart.model.HeartDAO;

@Service
public class CouponServiceImple implements CouponService {
	
	@Autowired
	private CouponDAO couponDao;
	@Autowired
	private HeartDAO heartDao;

	@Override
	public List<Map<String, Object>> selectCouponView(String id) {
		return couponDao.selectCouponView(id);
	}

	@Override
	public int selectByHeart(int heartNo) {
		return couponDao.selectByHeart(heartNo);
	}

	@Override
	public List<Map<String, Object>> selectHeartMemberCoupon(Map<String , Object> map) {
		return couponDao.selectHeartMemberCoupon(map);
	}

	@Override
	public List<CouponVO> selectAll() {
		return couponDao.selectAll();
	}
	
	@Override
	public int offerCoupon(Map<String, Object> map) {
		int heartNo =heartDao.selectHeartNo(map);
		System.out.println("heartNo="+heartNo);
		map.put("heartNo", heartNo);
		
		return couponDao.insertCouponList(map);
	}
}
