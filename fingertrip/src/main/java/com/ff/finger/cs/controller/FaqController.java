package com.ff.finger.cs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.cs.faq.model.FaqService;
import com.ff.finger.cs.faq.model.FaqVO;

@Controller
@RequestMapping("/cs/faq")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired private FaqService faqservice;
	
	@RequestMapping("/faq.do")
	public String selectFaqCategory(@RequestParam(defaultValue="1") int faqCategoryNo, Model model) {
		logger.info("faq 보여주기, 파라미터 faqCategoryNo={}", faqCategoryNo );
		
		List<FaqVO> list=faqservice.selectFaqCategory(faqCategoryNo);
		logger.info("faq 조회 결과 list.size={}", list.size());
		
		
		model.addAttribute("list", list);
		
		return "cs/faq/faq";
	}
	
}
