package com.ff.finger.cs.faq.model;

import java.util.List;
import java.util.Map;


public interface FaqService {
	public List<FaqVO> selectFaqCategory(int faqCategoryNo);
	public List<Map<String, Object>> allFaqCategory(int faqCategoryNo);
}
