package com.ff.finger.winBid.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WinBidDAOMybatis implements WinBidDAO{
	private String namespace="config.mybatis.mapper.oracle.winBid.";
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertWin(Map<String, Object> map) {
		return sqlSession.insert(namespace+"insertWin", map);
	}

	@Override
	public int checkWinByBidNo(int bidNo) {
		return sqlSession.selectOne(namespace + "checkWinByBidNo", bidNo);
	}

}
