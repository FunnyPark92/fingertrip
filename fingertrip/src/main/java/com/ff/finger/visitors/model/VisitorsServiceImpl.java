package com.ff.finger.visitors.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitorsServiceImpl implements VisitorsService{
	@Autowired
	private VisitorsDAO visitorsDao;

	@Override
	public int selectTodayCnt() {
		return visitorsDao.selectTodayCnt();
	}

	@Override
	public int insertInit() {
		return visitorsDao.insertInit();
	}

	@Override
	public int selectTodayIp(String ip) {
		return visitorsDao.selectTodayIp(ip);
	}

	@Override
	public int updateCnt(String ip) {
		int cnt=visitorsDao.insertIp(ip);
		System.out.println("ip 입력 후 cnt="+cnt);
		
		return visitorsDao.updateCnt();
	}

}
