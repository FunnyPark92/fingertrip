package com.ff.finger.travelAgency.model;

import java.util.List;

public interface TravelAgencyService {
	
	
	public int insertAgency(TravelAgencyVO vo);
	public boolean idDuplicate(String id);
	public boolean nameDuplicate(String name);
	public boolean checkLicenseNoDupl(String licenseNo);
	public List<TravelAgencyVO> selectAgency();
}
