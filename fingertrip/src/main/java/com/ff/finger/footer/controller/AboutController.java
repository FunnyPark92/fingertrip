package com.ff.finger.footer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	private static final Logger logger = LoggerFactory.getLogger(AboutController.class); 
	
	@RequestMapping("/footer/about.do")
	public String about() {   
		logger.info("회사소개 보여주기");
		
		return "footer/about";
	}
	
}

