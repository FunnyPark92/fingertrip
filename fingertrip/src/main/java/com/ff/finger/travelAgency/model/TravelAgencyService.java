package com.ff.finger.travelAgency.model;

import java.util.List;

import com.ff.finger.common.SearchVO;

public interface TravelAgencyService {
	public int insertAgency(TravelAgencyVO vo);
	public boolean idDuplicate(String id);
	public boolean nameDuplicate(String name);
	public boolean checkLicenseNoDupl(String licenseNo);
	public List<TravelAgencyVO> selectAgency(SearchVO vo);
	public int totalRecord(SearchVO vo);
	public TravelAgencyVO selectOneAgency(String name);
	public int deleteAgency(int travelAgencyNo);
	public int multiDelete(List<TravelAgencyVO> list);
	public int updateAgency(TravelAgencyVO vo);
	public int processAgencyLogin(String id, String password);
	public String getAgencyName(String agencyid);
	public TravelAgencyVO selectTravel(int travelAgencyNo);
	public TravelAgencyVO getAgencyVo(String agencyId);
}
