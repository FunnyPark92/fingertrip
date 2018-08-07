package com.ff.finger.course.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;
import com.ff.finger.travelspot.model.TravelSpotVO;

public interface CourseService {
	public List<Map<String, Object>> nacojjaList(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public int nacojjaWrite(CourseVO travelSpotVo, List<TravelSpotVO> travelSpotList);
	public List<CourseVO> myWriteSelectAll(SearchVO searchVo);
	public int myWriteCoursetotalRecord(SearchVO searchVo);
	public Map<String, Object> selectCourseProgress(int courseNo);
	public CourseVO selectOneCourse(int courseNo);
	public int selectMaxDay(int courseNo);
	public int updateProgress(Map<String, Object> map);
}
