package com.ff.finger.member.model;

public class OutReasonVO {
	private int outReasonNo;
	private String outReason;
	
	public int getOutReasonNo() {
		return outReasonNo;
	}
	public void setOutReasonNo(int outReasonNo) {
		this.outReasonNo = outReasonNo;
	}
	public String getOutReason() {
		return outReason;
	}
	public void setOutReason(String outReason) {
		this.outReason = outReason;
	}
	
	@Override
	public String toString() {
		return "OutReasonVO [outReasonNo=" + outReasonNo + ", outReason=" + outReason + "]";
	}

	
}
