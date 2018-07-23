package com.ff.finger.cs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cs")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	
	@RequestMapping("/faq/faq.do")
	public String faqRead() {
		logger.info("FAQ 보기 화면");
		
		return "cs/faq/faq";
	}
	
	
}
