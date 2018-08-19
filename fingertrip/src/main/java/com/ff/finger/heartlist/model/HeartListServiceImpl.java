package com.ff.finger.heartlist.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.PaginationInfo;

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

	@Override
	public List<Map<String, Object>> selectHeartListByMemberNoWithPaging(PaginationInfo paginationInfo) {
		return heartListDao.selectHeartListByMemberNoWithPaging(paginationInfo);
	}

	@Override
	public int getTotalRecord(int memberNo) {
		return heartListDao.getTotalRecord(memberNo);
	}

}
