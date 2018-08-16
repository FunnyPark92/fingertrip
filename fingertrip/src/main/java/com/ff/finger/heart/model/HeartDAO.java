package com.ff.finger.heart.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

public interface HeartDAO {
	public List<Map<String, Object>> myCourseList(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public int insertHeart(HeartVO heartVo);
	public List<HeartVO> selectByCourse(int courseNo);
	public int selectHeartNo(Map<String , Object> map);
	public int countHeartMember(HeartVO heartvo);
	public int updateCourseHeart(int courseNo);
	public int countHeart200(int courseNo);
}
