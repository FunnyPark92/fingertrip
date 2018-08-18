package com.ff.finger.travelAgency.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.SearchVO;

@Service
public class TravelAgencyServiceImpl implements TravelAgencyService {
	@Autowired 
	private TravelAgencyDAO travelAgencyDao;
	
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
	public boolean checkLicenseNoDupl(String licenseNo) {
		int cnt =travelAgencyDao.checkLicenseNo(licenseNo);
		if(cnt>0) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public List<TravelAgencyVO> selectAgency(SearchVO vo) {
		return travelAgencyDao.selectAgency(vo);
	}

	@Override
	public int totalRecord(SearchVO vo) {
		return travelAgencyDao.totalRecord(vo);
	}

	@Override
	public TravelAgencyVO selectOneAgency(String name) {
		return travelAgencyDao.selectOneAgency(name);
	}

	@Override
	public int deleteAgency(int travelAgencyNo) {
		return travelAgencyDao.deleteAgency(travelAgencyNo);
	}

	@Override
	public int multiDelete(List<TravelAgencyVO> list) {
		int cnt =0;
		try {
			for(TravelAgencyVO vo : list) {
				int travelAgencyNo = vo.getTravelAgencyNo();
				if(travelAgencyNo>0) {
					cnt = travelAgencyDao.deleteAgency(vo.getTravelAgencyNo());
				}
			}
		} catch (RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		
		return cnt;
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
	public int updateAgency(TravelAgencyVO vo) {
		return travelAgencyDao.updateAgency(vo);
	}

	@Override
	public int processAgencyLogin(String id, String password) {
		String dbPwd = travelAgencyDao.selectAgencyDbPwd(id);
		
		int result = 0;
		if (dbPwd != null && !dbPwd.isEmpty()) {
			if (dbPwd.equals(password)) {
				result = CommonConstants.LOGIN_OK;
			} else {
				result = CommonConstants.PWD_MISMATCH;
			}
		} else {
			result = CommonConstants.ID_NONE;
		}
		
		return result;
	}

	@Override
	public String getAgencyName(String agencyid) {
		return travelAgencyDao.getAgencyName(agencyid);
	}

	@Override
	public TravelAgencyVO selectTravel(int travelAgencyNo) {
		return travelAgencyDao.selectTravel(travelAgencyNo);
	}

	@Override
	public TravelAgencyVO getAgencyVo(String agencyId) {
		return travelAgencyDao.getAgencyVo(agencyId);
	}

}
