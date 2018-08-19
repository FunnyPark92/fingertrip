package com.ff.finger.visitors.model;

import java.sql.Timestamp;

public class VisitorsVO {
	
	private Timestamp visitorToday;
	private int visitorCount;
	
	public Timestamp getVisitorToday() {
		return visitorToday;
	}
	public void setVisitorToday(Timestamp visitorToday) {
		this.visitorToday = visitorToday;
	}
	public int getVisitorCount() {
		return visitorCount;
	}
	public void setVisitorCount(int visitorCount) {
		this.visitorCount = visitorCount;
	}
	
	@Override
	public String toString() {
		return "VisitorsVO [visitorToday=" + visitorToday + ", visitorCount=" + visitorCount + "]";
	}

}
