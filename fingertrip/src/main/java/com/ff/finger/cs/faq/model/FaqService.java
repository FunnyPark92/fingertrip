package com.ff.finger.cs.faq.model;

import java.util.List;


public interface FaqService {
	public List<FaqVO> selectFaqCategory(int faqCategoryNo);
}
