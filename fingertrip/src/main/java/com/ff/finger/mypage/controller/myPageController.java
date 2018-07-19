package com.ff.finger.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.member.controller.loginController;

@Controller
@RequestMapping("/myPage")
public class myPageController {
	private static final Logger logger = LoggerFactory.getLogger(loginController.class); 
	
	@RequestMapping("/myPayment/paymentList.do")
	public String myPayment() {
		logger.info("결제 내역 화면 보여주기");
		
		return "myPage/myPayment/paymentList";
	}
}
