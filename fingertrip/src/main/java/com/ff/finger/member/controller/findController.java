package com.ff.finger.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class findController {
	private static final Logger logger=LoggerFactory.getLogger(findController.class);
	
	@RequestMapping("/member/login/findId.do")
	public String findId() {
		logger.info("아이디 찾기 보여주기");
		
		return "member/login/findId";
	}
	
	@RequestMapping("/member/login/foundId.do")
	public String foundId() {
		logger.info("아이디 찾기 처리");
		
		return "member/login/foundId";
	}
	
	@RequestMapping("/member/login/findPw.do")
	public String findPw() {
		logger.info("비밀번호 찾기 보여주기");
		
		return "member/login/findPw";
	}
	
	@RequestMapping("/member/login/foundPw.do")
	public String foundPw() {
		logger.info("비밀번호 찾기 처리");
		
		return "member/login/foundPw";
	}
}
