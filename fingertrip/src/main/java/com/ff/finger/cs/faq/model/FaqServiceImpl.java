package com.ff.finger.cs.faq.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired private FaqDAO faqDao;

	@Override
	public List<FaqVO> selectFaqCategory(int faqCategoryNo) {
		return faqDao.selectFaqCategory(faqCategoryNo);
	}

}
