package com.ff.finger.travelAgency.model;

import java.util.List;

public interface TravelAgencyDAO {
	
	public int insertAgency(TravelAgencyVO vo);
	public int agencyIdCheck(String id);
	public int agencyNameCheck(String name);
	public int checkLicenseNo(String licenseNo);
	public List<TravelAgencyVO> selectAgency();
}
