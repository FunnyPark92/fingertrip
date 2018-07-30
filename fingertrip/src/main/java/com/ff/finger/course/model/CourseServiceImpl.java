package com.ff.finger.course.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.SearchVO;

@Service
public class CourseServiceImpl implements CourseService{
	@Autowired CourseDAO courseDao;
	
	@Override
	public List<Map<String, Object>> nacojjaList(SearchVO searchVo) {
		return courseDao.nacojjaList(searchVo);
	}

	@Override
	public int nacojja1Write(CourseVO courseVo) {
		return courseDao.nacojja1Write(courseVo);
	}

}
