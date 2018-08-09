package com.ff.finger.heartcharge.model;

import java.util.List;

public interface HeartChargeService {
	public int heartCharge(HeartChargeVO heartChargeVo);
	public List<HeartChargeVO> selectHeartChargeByMemberNo(int memberNo);
}
