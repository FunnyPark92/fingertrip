package com.ff.finger.winBid.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WinBidServiceImpl implements WinBidService{
	@Autowired
	private WinBidDAO winBidDao;
	
	@Override
	public int insertWin(Map<String, Object> map) {
		return winBidDao.insertWin(map);
	}

	@Override
	public int selectPayment(int mon) {
		return winBidDao.selectPayment(mon);
	}
	public WinBidVO selectWinBid(int bidNo) {
		return winBidDao.selectWinBid(bidNo);

	}

	@Override
	public int checkWinByBidNo(int bidNo) {
		return winBidDao.checkWinByBidNo(bidNo);
	}
}
