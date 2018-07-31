package com.ff.finger.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLoginController {
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class); 
	
	@RequestMapping("/admin/adminLogin.do")
	public String index() {
		logger.info("관리자 로그인 화면 보여주기");
		
		return "admin/adminLogin";
	}
	
	
	
}
