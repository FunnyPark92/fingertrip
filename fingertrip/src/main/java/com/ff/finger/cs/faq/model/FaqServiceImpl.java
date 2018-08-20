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

	@Override
	public FaqVO faqSelectByNo(int faqNo) {
		return faqDao.faqSelectByNo(faqNo);
	}

	@Override
	public int faqUpdate(FaqVO faqVo) {
		return faqDao.faqUpdate(faqVo);
	}

	@Override
	public int faqDelete(int faqNo) {
		return faqDao.faqDelete(faqNo);
	}

	@Override
	public int deleteMulti(Map<String, String[]> map) {
		return faqDao.deleteMulti(map);
	}

}
