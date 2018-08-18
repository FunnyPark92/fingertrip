package com.ff.finger.bid.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.SearchVO;

@Service
public class BidServiceImpl implements BidService{
	@Autowired 
	private BidDAO bidDao;
	
	@Override
	public List<Map<String, Object>> selectBidList(SearchVO searchVo) {
		return bidDao.selectBidList(searchVo);
	}

	@Override
	public int totalRecord(SearchVO searchVo) {
		return bidDao.totalRecord(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectByNo(int courseNo) {
		return bidDao.selectByNo(courseNo);
	}

	@Override
	public BidVO selectWin(int courseNo) {
		return bidDao.selectWin(courseNo);
	}

	@Override
	public int insertBId(BidVO bidVo) {
		int result =0;
		int cnt =bidDao.dupleTravelAgency(bidVo);
		if(cnt>0) {
			result = CommonConstants.EXIST_ID; //이미 입찰을 하였다.
		}else {
			result =bidDao.insertBId(bidVo);
		}
		return  result;
	}

	
}
