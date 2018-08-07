package com.ff.finger.bid.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.admin.model.AdminServiceImpl;
import com.ff.finger.common.SearchVO;

@Service
public class BidServiceImpl implements BidService{
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
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
}
