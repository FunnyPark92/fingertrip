package com.ff.finger.cs.notice.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired NoticeDAO boardDao;

	@Override
	public List<NoticeVO> selectAllNotice(SearchVO searchVo) {
		return boardDao.selectAllNotice(searchVo);
	}

	@Override
	public int totalRecord(SearchVO searchVo) {
		return boardDao.totalRecord(searchVo);
	}
	
	@Override
	public int countUpdateNotice(int noticeNo) {
		return boardDao.countUpdateNotice(noticeNo);
	}

	
}
