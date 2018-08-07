package com.ff.finger.bid.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

public interface BidService {
	public List<Map<String, Object>> selectBidList(SearchVO searchVo);
	public int totalRecord(SearchVO searchVo);
	public List<Map<String, Object>> selectByNo(int courseNo);
}
