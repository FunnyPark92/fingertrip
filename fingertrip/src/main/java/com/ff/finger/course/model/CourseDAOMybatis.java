package com.ff.finger.course.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;

@Repository
public class CourseDAOMybatis implements CourseDAO{
	private String namespace="config.mybatis.mapper.oracle.course.";
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> nacojjaList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"nacojjaList", searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);

	}
	
	@Override
	public int nacojja1Write(CourseVO courseVo) {
		return sqlSession.insert(namespace + "nacojja1Write", courseVo);
	}

}
