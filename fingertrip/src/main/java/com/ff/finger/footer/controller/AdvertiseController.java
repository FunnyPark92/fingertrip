package com.ff.finger.footer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdvertiseController {
	private static final Logger logger = LoggerFactory.getLogger(AdvertiseController.class); 
	
	@RequestMapping("/footer/advertise.do")
	public String index() {   
		logger.info("제휴 광고 문의 보여주기");
		
		return "footer/advertise";
	}
	
}
