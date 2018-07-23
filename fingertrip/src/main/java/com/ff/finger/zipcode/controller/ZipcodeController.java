package com.ff.finger.zipcode.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZipcodeController {
	private static final Logger logger = LoggerFactory.getLogger(ZipcodeController.class);
	
	@RequestMapping("/zipcode/zipcode.do")
	public String zipcode() {
		logger.info("우편번호 찾기");
		
		return "zipcode/zipcode";
	}
}
