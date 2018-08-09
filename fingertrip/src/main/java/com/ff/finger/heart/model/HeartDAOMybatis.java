package com.ff.finger.heart.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;

@Repository
public class HeartDAOMybatis implements HeartDAO{
	private String namespace="config.mybatis.mapper.oracle.heart.";
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> myCourseList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"myCourseList", searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);
	}

	@Override
	public int insertHeart(HeartVO heartVo) {
		return sqlSession.insert(namespace + "insertHeart", heartVo);
	}
	
	@Override
	public List<HeartVO> selectByCourse(int courseNo) {
		return sqlSession.selectList(namespace+"selectByCourse", courseNo);
	}

}
