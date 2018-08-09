package com.ff.finger.heartlist.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeartListServiceImpl implements HeartListService {
	@Autowired
	private HeartListDAO heartListDao;

	@Override
	public int insertHeartListUse(HeartListVO heartListVo) {
		return heartListDao.insertHeartListUse(heartListVo);
	}

	@Override
	public int insertHeartListCharge(HeartListVO heartListVo) {
		return heartListDao.insertHeartListCharge(heartListVo);
	}

	@Override
	public List<Map<String, Object>> selectHeartListByMemberNo(int memberNo) {
		return heartListDao.selectHeartListByMemberNo(memberNo);
	}

}
