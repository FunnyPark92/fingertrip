package com.ff.finger.course.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

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
	
}
