package com.ff.finger.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class loginController {
	private static final Logger logger = LoggerFactory.getLogger(loginController.class); 
	
	@RequestMapping("/login/login.do")
	public String index() {
		logger.info("로오오오그인 보여주기");
		logger.info("로그인화면 보여주기");
		
		return "login/login";
	}
	
}
