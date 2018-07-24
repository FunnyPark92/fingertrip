package com.ff.finger.cs.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAOMybatis implements BoardDAO {
	private String namespace="config.mybatis.mapper.oracle.qna.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardVO> selectAllBoard() {
		List<BoardVO> list=sqlSession.selectList(namespace+"selectAllBoard");
		return list;
	}
	
	

}
