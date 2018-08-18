package com.ff.finger.course.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;
import com.ff.finger.travelspot.model.TravelSpotVO;

public interface CourseDAO {
	public List<Map<String, Object>> nacojjaList(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public int nacojjaCourseWrite(CourseVO travelSpotVo);
	public int nacojjaTravelSpotWrite(CourseVO travelSpotVo);
	public List<CourseVO> myWriteSelectAll(SearchVO searchVo);
	public int myWriteCoursetotalRecord(SearchVO searchVo);
	public Map<String, Object> selectCourseProgress(int courseNo);
	public CourseVO selectOneCourse(int courseNo);
	public int selectMaxDay(int courseNo);
	public int updateProgress(Map<String, Object> map);
	public Map<String, Object> selectOneCTJoin(int courseNo);
	public List<TravelSpotVO> selectListTravelSpot(CourseVO vo);
	public List<CourseVO> selectProgress(SearchVO searchVo);
	public int getTotalRecordByPrgs(SearchVO searchVo);
	public Map<String, Object> selectMember(int courseNo);
	public List<TravelSpotVO> selectTravelSpot(int courseNo);
	public List<Map<String, Object>> selectListJoinMember(SearchVO searchVo);
	public Map<String, Object> selectOneJoinMember(int courseNo);
	public int ProgressNo2(int courseNo);
}
