package com.ff.finger.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class); 
	
	@RequestMapping("/index.do")
	public String index() {
		logger.info("로그인화면 보여주기 나도 여기서 이걸 고쳐버린다면");
		
		return "index";
	}
	
}
