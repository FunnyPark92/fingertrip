package com.ff.finger.cs.faq.model;


public class FaqVO {
	private int faqNo;
	private String title;
	private String content;
	private int adminNo;
	private int faqCategory;
	
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
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
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public int getFaqCategory() {
		return faqCategory;
	}
	public void setFaqCategory(int faqCategory) {
		this.faqCategory = faqCategory;
	}
	
	
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", title=" + title + ", content=" + content + ", adminNo=" + adminNo
				+ ", faqCategory=" + faqCategory + "]";
	}
	
	
}
