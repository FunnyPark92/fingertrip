package com.ff.finger.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.coupon.model.CouponService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class); 
	
	@Autowired CouponService couponService;
	
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
	public String myCoupon(HttpSession session,Model model) {
		String id =  (String) session.getAttribute("userid");
		logger.info("쿠폰 내역 화면 보여주기 파라미터 id={}",id);
		
		List<Map<String, Object>> list = couponService.selectCouponView(id);
		logger.info("쿠폰 검색 결과 list.size={}",list.size());
		
		model.addAttribute("list",list);
		
		return "myPage/myCoupon/couponList";
	}
	
	@RequestMapping("/myCourse/myCourseList.do")
	public String myCourseList(HttpSession session) {
		String userid=(String) session.getAttribute("userid");
		
		logger.info("내가 찜한 코스 화면 보여주기");
		
		
		return "myPage/myCourse/myCourseList";
	}
	
}
