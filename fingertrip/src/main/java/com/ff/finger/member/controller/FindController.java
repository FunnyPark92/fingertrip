package com.ff.finger.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;

@Controller
public class FindController {
	private static final Logger logger=LoggerFactory.getLogger(FindController.class);
	@Autowired private MemberService memberService;
	
	
	@RequestMapping("/member/login/findId.do")
	public String findId() {
		logger.info("아이디 찾기 보여주기");
		
		return "member/login/findId";
	}
	
	@RequestMapping("/member/login/foundId.do")
	public String foundId(@ModelAttribute MemberVO memberVo, @RequestParam String email, Model model) {
		logger.info("아이디 찾기 처리, 파라미터 memberVo={}, email={}", memberVo, email);
		
		String email1=email.substring(0, email.indexOf("@"));
		String email2=email.substring(email.indexOf("@")+1);

		memberVo.setEmail1(email1);
		memberVo.setEmail2(email2);
		logger.info("아이디 찾기, 이메일 처리 후 memberVo={}",memberVo);
		
		String id=memberService.findId(memberVo);
		memberVo.setId(id);
		logger.info("아이디 찾기 처리 후, memberVo={}", memberVo);
		
		model.addAttribute("vo", memberVo);
		
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
