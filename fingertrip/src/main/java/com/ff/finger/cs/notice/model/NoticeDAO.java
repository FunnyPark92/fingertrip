package com.ff.finger.cs.notice.model;

import java.util.List;

import com.ff.finger.common.SearchVO;

public interface NoticeDAO {
	public List<NoticeVO> selectAllNotice(SearchVO searchVO);
	public int countUpdateNotice(int noticeNo);
	public int totalRecord(SearchVO searchVo);
	public NoticeVO noticeDetail(int noticeNo);
	public int getAdminNo(String id);
	public int noticeInsert(NoticeVO noticeVo);
}
