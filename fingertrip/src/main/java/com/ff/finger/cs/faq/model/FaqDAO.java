package com.ff.finger.cs.faq.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.cs.notice.model.NoticeVO;



public interface FaqDAO {
	public List<FaqVO> selectFaqCategory(int faqCategoryNo);
	public List<Map<String, Object>> allFaqCategory(int faqCategoryNo);
	public int getAdminNo(String id);
	public int faqInsert(FaqVO faqVo);
	public FaqVO faqSelectByNo(int faqNo);
	public int faqUpdate(FaqVO faqVo);
	
}
