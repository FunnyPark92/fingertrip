package com.ff.finger.travelAgency.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TravelAgencyServiceImpl implements TravelAgencyService {

	@Autowired TravelAgencyDAO travelAgencyDao;
	
	@Override
	public int insertAgency(TravelAgencyVO vo) {
		return travelAgencyDao.insertAgency(vo);
	}

	@Override
	public boolean idDuplicate(String id) {
		int cnt = travelAgencyDao.agencyIdCheck(id);
		boolean result = false;
		if(cnt>0) {
			result = false; // 해당 아이디가 존재
		}else {
			result = true; //아이디 사용가능
		}
		return result;
	}

	@Override
	public boolean nameDuplicate(String name) {
		int cnt = travelAgencyDao.agencyNameCheck(name);
		boolean result =false;
		if(cnt>0) {
			result = false; // 해당 아이디가 존재
		}else {
			result = true; //아이디 사용가능
		}
		return result;
	}

	@Override
	public boolean checkLicenseNoDupl(String licenseNo) {
		int cnt =travelAgencyDao.checkLicenseNo(licenseNo);
		if(cnt>0) {
			return false;
		}else {
			return true;
		}
	
	}

	@Override
	public List<TravelAgencyVO> selectAgency() {
		return travelAgencyDao.selectAgency();
	}

	

}
