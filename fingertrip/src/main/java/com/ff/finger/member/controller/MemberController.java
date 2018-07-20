package com.ff.finger.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.member.model.MemberVO;


@Controller
@RequestMapping("/member")
public class MemberController {
   private static final Logger logger
      =LoggerFactory.getLogger(MemberController.class);
   
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
   public String insertMember(@ModelAttribute MemberVO memberVo, Model model) {
	   logger.info("회원가입 처리 전 파라미터 memberVo={}", memberVo);
	   
	   
	   
	   return "index";
   }

   @RequestMapping("/memberOut.do")
   public String memberOut() {
      logger.info("회원탈퇴 화면 보여주기");
      
      return "member/memberOut";
   }
   
   @RequestMapping("/memberEdit.do")
   public String memberEdit() {
      logger.info("회원수정 화면 보여주기");
      
      return "member/memberEdit";
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