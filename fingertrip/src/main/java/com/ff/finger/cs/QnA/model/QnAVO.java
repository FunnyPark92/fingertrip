package com.ff.finger.cs.QnA.model;

import java.sql.Timestamp;

public class QnAVO {
	private int qnaNo;
	private String title;
	private String content;
	private String name;
	private String password;
	private Timestamp regDate;
	private int readCount;
	private int groupNo;
	private int step;
	private int sortNo;
	private String delFlag;
	private int travelAgencyNo;
	private int adminNo;
	private int memberNo;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getSortNo() {
		return sortNo;
	}
	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public int getTravelAgencyNo() {
		return travelAgencyNo;
	}
	public void setTravelAgencyNo(int travelAgencyNo) {
		this.travelAgencyNo = travelAgencyNo;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", title=" + title + ", content=" + content + ", name=" + name + ", password="
				+ password + ", regDate=" + regDate + ", readCount=" + readCount + ", groupNo=" + groupNo + ", step="
				+ step + ", sortNo=" + sortNo + ", delFlag=" + delFlag + ", travelAgencyNo=" + travelAgencyNo
				+ ", adminNo=" + adminNo + ", memberNo=" + memberNo + "]";
	}
   
}
