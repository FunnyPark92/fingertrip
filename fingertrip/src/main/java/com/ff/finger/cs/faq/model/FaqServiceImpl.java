package com.ff.finger.cs.faq.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired private FaqDAO faqDao;

	@Override
	public List<FaqVO> selectFaqCategory(int faqCategoryNo) {
		return faqDao.selectFaqCategory(faqCategoryNo);
	}

	@Override
	public List<Map<String, Object>> allFaqCategory(int faqCategoryNo) {
		return faqDao.allFaqCategory(faqCategoryNo);
	}

	@Override
	public int getAdminNo(String id) {
		return faqDao.getAdminNo(id);
	}

	@Override
	public int faqInsert(FaqVO faqVo) {
		return faqDao.faqInsert(faqVo);
	}

}
