package com.ff.finger.footer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TermController {
	private static final Logger logger = LoggerFactory.getLogger(TermController.class); 
	
	@RequestMapping("/footer/term.do")
	public String term() {   
		logger.info("이용약관 문의 보여주기");
		
		return "footer/term";
	}
	
}
