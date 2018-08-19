package com.ff.finger.visitors.model;

import java.util.List;

public interface VisitorsService {
	
	public int selectTodayCnt();
	public int insertInit();
	public int selectTodayIp(String ip);
	public int updateCnt(String ip);
	public List<VisitorsVO> selectWeekCnt();
}
