package com.ff.finger.winBid.model;

import java.util.Map;

public interface WinBidDAO {
	public int insertWin(Map<String, Object> map);
	//차트를 위한 메서드 삽입
	public int selectPayment(int mon);
	public WinBidVO selectWinBid(int bidNo);
	public int checkWinByBidNo(int bidNo);
}
