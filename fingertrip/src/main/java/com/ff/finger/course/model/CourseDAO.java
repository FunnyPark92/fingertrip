package com.ff.finger.course.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

public interface CourseDAO {
	public List<Map<String, Object>> nacojjaList(SearchVO searchVo);
}
