package com.ff.finger.cs.notice.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired NoticeDAO noticeDao;

	@Override
	public List<Map<String, Object>> selectAllNotice(SearchVO searchVo) {
		return noticeDao.selectAllNotice(searchVo);
	}

	@Override
	public int totalRecord(SearchVO searchVo) {
		return noticeDao.totalRecord(searchVo);
	}
	
	@Override
	public int countUpdateNotice(int noticeNo) {
		return noticeDao.countUpdateNotice(noticeNo);
	}

	@Override
	public List<NoticeVO> noticeDetail(int noticeNo) {
		int rnum=noticeDao.getNoticeRnum(noticeNo);
		System.out.println("공지사항 rnum="+rnum);
		return noticeDao.noticeDetail(rnum);
	}

	@Override
	public int getAdminNo(String id) {
		return noticeDao.getAdminNo(id);
	}

	@Override
	public int noticeInsert(NoticeVO noticeVo) {
		return noticeDao.noticeInsert(noticeVo);
	}

	@Override
	public NoticeVO noticeSelectByNo(int noticeNo) {
		return noticeDao.noticeSelectByNo(noticeNo);
	}

	@Override
	public int noticeUpdate(NoticeVO noticeVo) {
		return noticeDao.noticeUpdate(noticeVo);
	}

	@Override
	public int noticeDelete(int noticeNo) {
		return noticeDao.noticeDelete(noticeNo);
	}

	@Override
	public int deleteMulti(Map<String, String[]> map) {
		return noticeDao.deleteMulti(map);
	}

	@Override
	public String selectFileName(String noticeNo) {
		return noticeDao.selectFileName(noticeNo);
	}


	


	

	
}
