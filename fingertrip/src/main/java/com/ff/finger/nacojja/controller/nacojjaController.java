package com.ff.finger.nacojja.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class nacojjaController {
	private static final Logger logger = LoggerFactory.getLogger(nacojjaController.class);
	
	@RequestMapping("/nacojja/nacojjaList.do")
	public String nacojjaList() {
		logger.info("나코짜 목록 보여주기");
		
		return "nacojja/nacojjaList";
	}
}
