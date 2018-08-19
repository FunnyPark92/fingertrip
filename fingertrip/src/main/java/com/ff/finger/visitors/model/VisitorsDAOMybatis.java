package com.ff.finger.visitors.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitorsDAOMybatis implements VisitorsDAO{
	private String namespace="config.mybatis.mapper.oracle.visitors.";
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectTodayCnt() {
		return sqlSession.selectOne(namespace+"selectTodayCnt");
	}

	@Override
	public int insertInit() {
		return sqlSession.insert(namespace+"insertInit");
	}

	@Override
	public int selectTodayIp(String ip) {
		return sqlSession.selectOne(namespace+"selectTodayIp", ip);
	}

	@Override
	public int insertIp(String ip) {
		return sqlSession.insert(namespace+"insertIp", ip);
	}

	@Override
	public int updateCnt() {
		return sqlSession.update(namespace+"updateCnt");
	}
}
