package com.ff.finger.travelAgency.model;

public interface TravelAgencyService {
	
	
	public int insertAgency(TravelAgencyVO vo);
	public boolean idDuplicate(String id);
	public boolean nameDuplicate(String name);
	public boolean checkLicenseNoDupl(String licenseNo);
}
