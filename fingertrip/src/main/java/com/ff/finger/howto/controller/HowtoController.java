package com.ff.finger.howto.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HowtoController {
	private static final Logger logger = LoggerFactory.getLogger(HowtoController.class); 
	
	@RequestMapping("/howto/howto.do")
	public String howto() {   
		logger.info("이용방법 보여주기");
		
		return "howto/howto";
	}
	
}

