package com.ff.finger.travelAgency.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;

@Repository
public class TravelAgencyDAOMybatis implements TravelAgencyDAO {
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
	public List<TravelAgencyVO> selectAgency(SearchVO vo) {
		return sqlSession.selectList(namespace+"selectAgency",vo);
	}

	@Override
	public int totalRecord(SearchVO vo) {
		return sqlSession.selectOne(namespace+"totalRecord",vo);
	}

	@Override
	public TravelAgencyVO selectOneAgency(String name) {
		return sqlSession.selectOne(namespace+"selectOneAgency",name);
	}

	@Override
	public int deleteAgency(int travelAgencyNo) {
		return sqlSession.delete(namespace+"deleteAgency",travelAgencyNo);
	}

	@Override
	public int updateAgency(TravelAgencyVO vo) {
		return sqlSession.update(namespace+"updateAgency",vo);
	}

	@Override
	public String selectAgencyDbPwd(String id) {
		return sqlSession.selectOne(namespace + "selectAgencyDbPwd", id);
	}

	@Override
	public String getAgencyName(String agencyid) {
		return sqlSession.selectOne(namespace+"getAgencyName", agencyid);
	}

	@Override
	public TravelAgencyVO selectTravel(int travelAgencyNo) {
		return sqlSession.selectOne(namespace+"selectTravel",travelAgencyNo);
	}

	@Override
	public TravelAgencyVO getAgencyVo(String agencyId) {
		return sqlSession.selectOne(namespace+"getAgencyVo", agencyId);
	}
}
