package com.ff.finger.cs.faq.model;
import com.ff.finger.common.SearchVO;

public class FaqCategoryVO /*extends SearchVO*/ {
	private int faqCategoryNo;
	private String title;
	
	public int getFaqCategotyNo() {
		return faqCategoryNo;
	}
	public void setFaqCategoryNo(int faqCategoryNo) {
		this.faqCategoryNo = faqCategoryNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "FaqCategoryVO [faqCategotyNo=" + faqCategoryNo + ", title=" + title + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
}
