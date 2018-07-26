package com.ff.finger.cs.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;

@Repository
public class BoardDAOMybatis implements BoardDAO{
	private String namespace="config.mybatis.mapper.oracle.qna.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardVO> selectAllBoard(SearchVO searchVO) {
		return sqlSession.selectList(namespace+"selectAllBoard", searchVO);
	}

	@Override
	public int totalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"totalRecord", searchVo);
	}
	
	@Override
	public int countUpdateboard(int boardNo) {
		return 0;
	}

	
	

}
