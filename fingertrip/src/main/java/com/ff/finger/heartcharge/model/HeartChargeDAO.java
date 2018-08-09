package com.ff.finger.heartcharge.model;

import java.util.List;

public interface HeartChargeDAO {
	public int heartCharge(HeartChargeVO heartChargeVo);
	public List<HeartChargeVO> selectHeartChargeByMemberNo(int memberNo);
}
