package com.ff.finger.cs.faq.model;

public class FaqCategoryVO /*extends SearchVO*/ {
	private int faqCategoryNo;
	private String faqCateTitle;
	
	public int getFaqCategoryNo() {
		return faqCategoryNo;
	}
	public void setFaqCategoryNo(int faqCategoryNo) {
		this.faqCategoryNo = faqCategoryNo;
	}
	public String getFaqCateTitle() {
		return faqCateTitle;
	}
	public void setFaqCateTitle(String faqCateTitle) {
		this.faqCateTitle = faqCateTitle;
	}
	
	@Override
	public String toString() {
		return "FaqCategoryVO [faqCategoryNo=" + faqCategoryNo + ", faqCateTitle=" + faqCateTitle + ", toString()="
				+ super.toString() + "]";
	}
	
}
