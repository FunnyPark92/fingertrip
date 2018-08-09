package com.ff.finger.heart.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

public interface HeartService {
	public List<Map<String, Object>> myCourseList(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public List<HeartVO> selectByCourse(int courseNo);
}
