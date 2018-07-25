package com.ff.finger.cs.board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAOMybatis implements BoardDAO {
	private String namespace="config.mybatis.mapper.oracle.qna.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectAllBoard() {
		 return sqlSession.selectList(namespace+"selectAllBoard");
	
	}
}
