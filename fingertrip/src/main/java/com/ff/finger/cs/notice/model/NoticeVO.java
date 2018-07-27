package com.ff.finger.cs.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int noticeNo;
	private String title;
	private String content;
	private Timestamp regDate;
	private int adminNo;
	private int readCount;
	
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	@Override
	public String toString() {
		return "BoardVO [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", adminNo=" + adminNo + ", readCount=" + readCount + "]";
	}
	
}