package com.ff.finger.travelAgency.model;

import java.util.List;

import com.ff.finger.common.SearchVO;

public interface TravelAgencyDAO {
	
	public int insertAgency(TravelAgencyVO vo);
	public int agencyIdCheck(String id);
	public int agencyNameCheck(String name);
	public int checkLicenseNo(String licenseNo);
	public List<TravelAgencyVO> selectAgency(SearchVO vo);
	public int totalRecord(SearchVO vo);
	public TravelAgencyVO selectOneAgency(String name);
	public int deleteAgency(int travelAgencyNo);
	public int updateAgency(TravelAgencyVO vo);
}
