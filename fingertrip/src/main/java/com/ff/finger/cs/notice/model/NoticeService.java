package com.ff.finger.cs.notice.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

public interface NoticeService {
	public List<NoticeVO> selectAllNotice(SearchVO searchVo);
	public int countUpdateNotice(int noticeNo);
	public int totalRecord(SearchVO searchVo);
	public List<NoticeVO> noticeDetail(int noticeNo);
	public int getAdminNo(String id);
	public int noticeInsert(NoticeVO noticeVo);
	public NoticeVO noticeSelectByNo(int noticeNo);
	public int noticeUpdate(NoticeVO noticeVo);
	public int noticeDelete(int noticeNo);
	public int deleteMulti(Map<String, String[]> map);
	public String selectFileName(String noticeNo);
}
