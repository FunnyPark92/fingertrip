package com.ff.finger.winBid.model;

import java.util.Map;

public interface WinBidService {
	public int insertWin(Map<String, Object> map);
	public int selectPayment(int mon);
	public WinBidVO selectWinBid(int bidNo);
	public int checkWinByBidNo(int bidNo);
}
