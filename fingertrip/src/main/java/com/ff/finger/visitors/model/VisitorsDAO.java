package com.ff.finger.visitors.model;

import java.util.List;

public interface VisitorsDAO {
	public int selectTodayCnt();
	public int insertInit();
	public int selectTodayIp(String ip);
	public int insertIp(String ip);
	public int updateCnt();
	public List<VisitorsVO> selectWeekCnt();
}
