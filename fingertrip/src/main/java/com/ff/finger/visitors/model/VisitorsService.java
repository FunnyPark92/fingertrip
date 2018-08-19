package com.ff.finger.visitors.model;

public interface VisitorsService {
	
	public int selectTodayCnt();
	public int insertInit();
	public int selectTodayIp(String ip);
	public int updateCnt(String ip);
}
