package com.ff.finger.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;

@Controller
@RequestMapping("/member/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class); 
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login_get() {
		logger.info("로그인 화면 보여주기");
		
		return "member/login/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_post(@ModelAttribute MemberVO memberVo,
							@RequestParam(required=false) String saveId1,
							HttpServletRequest request,
							HttpServletResponse response,
							Model model) {
		logger.info("로그인 처리 전 파라미터, memberVo={}", memberVo);
		logger.info("로그인 처리 전 파라미터, saveId={}", saveId1);
		
		int result = memberService.processLogin(memberVo.getId(), memberVo.getPassword());
		logger.info("로그인 처리 결과, result={}", result);		
		
		String msg = "", url = "/member/login/login.do";
		if (result == CommonConstants.LOGIN_OK) {
			//[1] 세션에 저장
			request.getSession().setAttribute("userid", memberVo.getId());
			//회원정보 읽어오기
			//String userName = memberService.selectUserName(vo.getUserid());
			//request.getSession().setAttribute("userName", userName);
			
			//[2] 아이디 저장에 체크되었으면 쿠키에 저장
			Cookie ck = new Cookie("ck_userid", memberVo.getId());
			ck.setPath("/");
			
			if (saveId1 != null) {
				ck.setMaxAge(30*24*60*60); //쿠키 유효기간 - 30일
				response.addCookie(ck);
			} else {
				ck.setMaxAge(0); //쿠키 삭제
				response.addCookie(ck);
			}
			
			msg = "로그인 되었습니다!";
			//msg = userName + "님 로그인 되었습니다!";
			url = "/index.do";
		} else if (result == CommonConstants.PWD_MISMATCH){
			msg = "비밀번호 불일치!";
		} else if (result == CommonConstants.ID_NONE) {
			msg = "존재하지 않는 아이디임!";
		} else {
			msg = "로그인 처리 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("userid");
		//session.removeAttribute("userName");
		
		return "redirect:/index.do";
	}
	
}
