package com.ff.finger.course.model;

import java.sql.Date;
import java.sql.Timestamp;

public class CourseVO {
	private int courseNo; /* 코스번호 NOT NULL*/
	private String title; /* 제목 NOT NULL*/
	private Date startDay; /* 출발일 NOT NULL*/
	private Date endDay; /* 도착일 NOT NULL*/
	private String thumbImg; /* 대표이미지 NOT NULL*/
	private String content; /* 설명 */
	private int heartCount; /* 하트수 DEFAULT 0*/
	private Timestamp bidStartDay; /* 입찰시작일 */
	private Timestamp regDate; /* 등록일 DEFAULT SYSDATE*/
	private int memberNo; /* 회원번호 NOT NULL*/
	private int progressNo; /* 진행상태번호 DEFAULT 1*/
	
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
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getEndDay() {
		return endDay;
	}
	public void setEndDay(Date endDay) {
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
