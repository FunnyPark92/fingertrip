package com.ff.finger.nacojja.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NacojjaController {
	private static final Logger logger = LoggerFactory.getLogger(NacojjaController.class);
	
	@RequestMapping("/nacojja/nacojjaList.do")
	public String nacojjaList() {
		logger.info("나코짜 목록 보여주기");
		
		return "nacojja/nacojjaList";
	}
	
	@RequestMapping("/nacojja/nacojja1.do")
	public String nacojja1() {
		logger.info("나코짜 작성화면1 보여주기");
		
		return "nacojja/nacojja1";
	}
	
	@RequestMapping("/nacojja/nacojja2.do")
	public String nacojja2() {
		logger.info("나코짜 작성화면2 보여주기");
		
		return "nacojja/nacojja2";
	}
	
}
