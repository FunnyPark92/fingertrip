package com.ff.finger.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


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
   
   @RequestMapping("/member/memberOut.do")
   public String memberOut() {
      logger.info("회원탈퇴 화면 보여주기");
      
      return "member/memberOut";
   }
   
}