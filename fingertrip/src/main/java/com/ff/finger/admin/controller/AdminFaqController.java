package com.ff.finger.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.cs.faq.model.FaqService;

@Controller
@RequestMapping("/admin/cs/faq")
public class AdminFaqController {
	private static final Logger logger=LoggerFactory.getLogger(AdminFaqController.class);
	
	@Autowired private FaqService faqservice;
	
	@RequestMapping("/faqList.do")
	public String allFaqCategory(@RequestParam(defaultValue="1") int faqCategoryNo, Model model) {
		logger.info("faq 보여주기, faqCategoryNo={}", faqCategoryNo );
		List<Map<String, Object>> list=faqservice.allFaqCategory(faqCategoryNo);
		logger.info("faq 조회 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/cs/faq/faqList";
	}
	
}
