package com.ff.finger.travelAgency.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TravelAgencyDAOMybatis implements TravelAgencyDAO{
	private String namespace ="config.mybatis.mapper.oracle.travelAgency.";
	
	@Autowired	private SqlSessionTemplate sqlSession;

	@Override
	public int insertAgency(TravelAgencyVO vo) {
		return sqlSession.insert(namespace+"insertAgency",vo);
	}

	@Override
	public int agencyIdCheck(String id) {
		return sqlSession.selectOne(namespace+"agencyIdCheck",id);
	}

	@Override
	public int agencyNameCheck(String name) {
		return sqlSession.selectOne(namespace+"agencyNameCheck",name);
	}

	@Override
	public int checkLicenseNo(String licenseNo) {
		return sqlSession.selectOne(namespace+"checkLicenseNo",licenseNo);
	}

	@Override
	public List<TravelAgencyVO> selectAgency() {
		return sqlSession.selectList(namespace+"selectAgency");
	}

}
