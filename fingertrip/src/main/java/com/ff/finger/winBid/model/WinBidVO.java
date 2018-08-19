package com.ff.finger.winBid.model;

public class WinBidVO {

	
	private int winBidNo;
	private int winBidPrice;
	private int bidNo;
	public int getWinBidNo() {
		return winBidNo;
	}
	public void setWinBidNo(int winBidNo) {
		this.winBidNo = winBidNo;
	}
	public int getWinBidPrice() {
		return winBidPrice;
	}
	public void setWinBidPrice(int winBidPrice) {
		this.winBidPrice = winBidPrice;
	}
	public int getBidNo() {
		return bidNo;
	}
	public void setBidNo(int bidNo) {
		this.bidNo = bidNo;
	}
	@Override
	public String toString() {
		return "WinBidVO [winBidNo=" + winBidNo + ", winBidPrice=" + winBidPrice + ", bidNo=" + bidNo + "]";
	}
	
	
	
}
