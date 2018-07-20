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
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/agreement.do")
	public String agreement() {
		logger.info("회원약관 화면 보여주기");
		return "member/agreement";
	}

	@RequestMapping("/register.do")
	public void register() {
		logger.info("회원가입 화면 보여주기");
	}

	@RequestMapping("/insertMember.do")
	public String insertMember(@ModelAttribute MemberVO memberVo, @RequestParam String email3, Model model) {
		logger.info("회원가입 처리 전 파라미터, memberVo={}", memberVo);
		logger.info("회원가입 처리 전 파라미터, email3={}", email3);

		if (email3 != null && !email3.isEmpty()) {
			memberVo.setEmail2(email3);
		}

		if (memberVo.getEmail1() == null || memberVo.getEmail1().isEmpty()) {
			memberVo.setEmail2("");
		}

		if (memberVo.getHp2() == null || memberVo.getHp2().isEmpty() || 
			memberVo.getHp3() == null || memberVo.getHp3().isEmpty()) {
			memberVo.setHp1("");
			memberVo.setHp2("");
			memberVo.setHp3("");
		}
		
		logger.info("회원가입 세팅 후 파라미터, memberVo={}", memberVo);

		int cnt = memberService.insertMember(memberVo);
		logger.info("회원가입 처리 결과, cnt={}", cnt);
		
		String msg = "", url = "";
		if (cnt > 0) {
			msg = "회원가입 되았으~";
			url = "/index.do";
		} else {
			msg = "회원가입 실패";
			url = "/member/register.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping("/memberOut.do")
	public String memberOut() {
		logger.info("회원탈퇴 화면 보여주기");

		return "member/memberOut";
	}

	@RequestMapping("/memberEdit.do")
	   public String memberEdit() {
	      logger.info("회원수정 비밀번호 확인 화면 보여주기");
	      
	      return "member/memberEdit";
	   }
	   
	   @RequestMapping("/memberEditOk.do")
	   public String memberEditOk() {
	      logger.info("회원수정 화면 보여주기");
	      
	      return "member/memberEditOk";
	   }

	@RequestMapping("/memberOutReason.do")
	public String memberOutReason() {
		logger.info("회원탈퇴 사유 화면 보여주기");

		return "member/memberOutReason";
	}

	@RequestMapping("/memberOutOk.do")
	public String memberOutOk() {
		logger.info("회원탈퇴 완료 화면 보여주기");

		return "member/memberOutOk";
	}
}