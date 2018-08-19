package com.ff.finger.heartlist.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.PaginationInfo;

public interface HeartListDAO {
	public int insertHeartListUse(HeartListVO heartListVo);
	public int insertHeartListCharge(HeartListVO heartListVo);
	public List<Map<String, Object>> selectHeartListByMemberNo(int memberNo);
	public List<Map<String, Object>> selectHeartListByMemberNoWithPaging(PaginationInfo paginationInfo);
	public int getTotalRecord(int memberNo);
}
