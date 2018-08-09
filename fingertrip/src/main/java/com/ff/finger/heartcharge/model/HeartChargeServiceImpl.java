package com.ff.finger.heartcharge.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeartChargeServiceImpl implements HeartChargeService {

	@Autowired
	private HeartChargeDAO heartChargeDao;
	
	@Override
	public int heartCharge(HeartChargeVO heartChargeVo) {
		return heartChargeDao.heartCharge(heartChargeVo);
	}

}
