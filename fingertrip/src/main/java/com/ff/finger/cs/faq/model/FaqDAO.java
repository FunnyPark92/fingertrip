package com.ff.finger.cs.faq.model;

import java.util.List;

public interface FaqDAO {
	public List<FaqVO> selectFaqCategory(int faqCategoryNo);
	
}
