package com.ff.finger.heartcharge.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HeartChargeDAOMybatis implements HeartChargeDAO {
	private String namespace = "config.mybatis.mapper.oracle.heartcharge.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int heartCharge(HeartChargeVO heartChargeVo) {
		return sqlSession.insert(namespace + "heartCharge", heartChargeVo);
	}

	@Override
	public List<HeartChargeVO> selectHeartChargeByMemberNo(int memberNo) {
		return sqlSession.selectList(namespace + "selectHeartChargeByMemberNo", memberNo);
	}

}
