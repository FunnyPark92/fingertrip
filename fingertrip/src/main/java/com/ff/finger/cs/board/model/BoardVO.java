package com.ff.finger.cs.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int noticeNo;
	private String title;
	private String content;
	private Timestamp regDate;
	private int adminNo;
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	@Override
	public String toString() {
		return "BoardVO [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", adminNo=" + adminNo + "]";
	}
}
