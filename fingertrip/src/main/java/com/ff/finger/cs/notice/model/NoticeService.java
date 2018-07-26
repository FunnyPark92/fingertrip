package com.ff.finger.cs.notice.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

public interface NoticeService {
	public List<NoticeVO> selectAllNotice(SearchVO searchVo);
	public int countUpdateNotice(int noticeNo);
	public int totalRecord(SearchVO searchVo);
}
