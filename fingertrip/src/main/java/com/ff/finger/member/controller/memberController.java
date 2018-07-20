package com.ff.finger.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {
	private static final Logger logger=LoggerFactory.getLogger(memberController.class);
	
	@RequestMapping("/member/memberOut.do")
	public String memberOut() {
		logger.info("회원탈퇴 화면 보여주기");
		
		return "member/memberOut";
	}
	
	@RequestMapping("/member/memberOutReason.do")
	public String memberOutReason() {
		logger.info("회원탈퇴 사유 화면 보여주기");
		
		return "member/memberOutReason";
	}
	
	
}
