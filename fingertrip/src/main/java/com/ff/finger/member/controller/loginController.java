package com.ff.finger.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class loginController {
	private static final Logger logger = LoggerFactory.getLogger(loginController.class); 
	
	@RequestMapping("/login/login.do")
	public String login() {
		logger.info("로그인 화면 보여주기");
		
		return "member/login/login";
	}
	
}
