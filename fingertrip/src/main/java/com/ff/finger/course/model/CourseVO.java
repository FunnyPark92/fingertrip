package com.ff.finger.course.model;

import java.sql.Timestamp;

public class CourseVO {
	private int courseNo;
	private String title;
	private Timestamp startDay;
	private Timestamp endDay;
	private String thumbImg;
	private String content;
	private int heartCount;
	private Timestamp bidStartDay;
	private Timestamp regDate;
	private int memberNo;
	private int progressNo;
	
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getStartDay() {
		return startDay;
	}
	public void setStartDay(Timestamp startDay) {
		this.startDay = startDay;
	}
	public Timestamp getEndDay() {
		return endDay;
	}
	public void setEndDay(Timestamp endDay) {
		this.endDay = endDay;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHeartCount() {
		return heartCount;
	}
	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}
	public Timestamp getBidStartDay() {
		return bidStartDay;
	}
	public void setBidStartDay(Timestamp bidStartDay) {
		this.bidStartDay = bidStartDay;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getProgressNo() {
		return progressNo;
	}
	public void setProgressNo(int progressNo) {
		this.progressNo = progressNo;
	}

	@Override
	public String toString() {
		return "CourseVO [courseNo=" + courseNo + ", title=" + title + ", startDay=" + startDay + ", endDay=" + endDay
				+ ", thumbImg=" + thumbImg + ", content=" + content + ", heartCount=" + heartCount + ", bidStartDay="
				+ bidStartDay + ", regDate=" + regDate + ", memberNo=" + memberNo + ", progressNo=" + progressNo + "]";
	}
	
}
