package com.ff.finger.admin.controller;

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

import com.ff.finger.admin.model.AdminService;
import com.ff.finger.admin.model.AdminVO;
import com.ff.finger.common.CommonConstants;

@Controller
public class AdminLoginController {
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class); 
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/admin/adminLogin.do", method=RequestMethod.GET)
	public String index() {
		logger.info("관리자 로그인 화면 보여주기");
		
		return "admin/adminLogin";
	}
	
	@RequestMapping(value="/admin/adminLogin.do", method=RequestMethod.POST)
	public String adminLogin(@ModelAttribute AdminVO adminVo, HttpServletRequest request,
			HttpServletResponse response,Model model,@RequestParam(required=false) String saveid) {
		logger.info("관리자 로그인 처리 파라미터 adminVo={},saveID",adminVo,saveid);
		
		String msg="", url="/admin/adminLogin.do";
		int result = adminService.loginAdmin(adminVo.getId(), adminVo.getPassword());
		if(result==CommonConstants.LOGIN_OK) {
			msg="로그인 되었습니다.";
			request.getSession().setAttribute("adminid", adminVo.getId());
			url="/admin/agency/agencyList.do";
			Cookie ck =  new Cookie("ck_adminid",adminVo.getId());
			ck.setPath("/");
			if(saveid != null) {
				ck.setMaxAge(30*24*60*60); //유효기간 30일
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0); //쿠키삭제
				response.addCookie(ck);
			}
		}else if(result==CommonConstants.PWD_MISMATCH){
			msg="비밀번호가 일치하지 않습니다.";
		}else {
			msg="아이디가 존재 하지 않습니다.";
		}
		logger.info("controller result={}",request);
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/admin/adminLogout.do")
	public String adminLogout(HttpSession session) {
		String id =  (String)session.getAttribute("adminid");
		logger.info("관리자 로그 아웃 처리 id={}",id);
		
		session.removeAttribute("adminid");
		
		return "redirect:/admin/adminLogin.do";
	}
	
	
	
}


































