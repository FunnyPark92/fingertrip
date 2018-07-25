package com.ff.finger.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class); 
	
	@RequestMapping("/myPayment/paymentList.do")
	public String myPayment() {
		logger.info("결제 내역 화면 보여주기");
		
		return "myPage/myPayment/paymentList";
	}
	
	@RequestMapping("/myHeart/heartList.do")
	public String myHeart() {
		logger.info("하트 내역 화면 보여주기");
		
		return "myPage/myHeart/heartList";
	}
	
	@RequestMapping("/myHeart/heartCharge.do")
	public String heartCharge() {
		logger.info("하트 화면 보여주기");
		
		return "myPage/myHeart/heartCharge";
	}
	
	@RequestMapping("/myCoupon/couponList.do")
	public String myCoupon() {
		logger.info("쿠폰 내역 화면 보여주기");
		
		return "myPage/myCoupon/couponList";
	}
	
	@RequestMapping("/myCourse/myCourseList.do")
	public String myCourseList() {
		logger.info("내가 찜한 코스 화면 보여주기");
		
		return "myPage/myCourse/myCourseList";
	}
	
}
