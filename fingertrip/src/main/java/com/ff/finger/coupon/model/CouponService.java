package com.ff.finger.coupon.model;

import java.util.List;
import java.util.Map;

public interface CouponService {

	public List<Map<String , Object>> selectCouponView(String id);
}
