package com.ff.finger.bid.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;

@Repository
public class BidDAOMybatis implements BidDAO{
	
	private String namespace = "config.mybatis.mapper.oracle.bid.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> selectBidList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectBidList", searchVo);
	}

	@Override
	public int totalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"totalRecord", searchVo);
	}

	@Override
	public List<Map<String, Object>> selectByNo(int courseNo) {
		return sqlSession.selectList(namespace+"selectByNo", courseNo);
	}

}
