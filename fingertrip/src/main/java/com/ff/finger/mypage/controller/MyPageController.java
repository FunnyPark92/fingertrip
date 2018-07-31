package com.ff.finger.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.heart.model.HeartService;
import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class); 
	@Autowired 
	private MemberService memberService;
	@Autowired
	private HeartService heartService;
	
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
	public String myCourseList(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
		String userid=(String) session.getAttribute("userid");
		MemberVO memberVo=memberService.logingMember(userid);
		int memberNo=memberVo.getMemberNo();
		searchVo.setMemberNo(memberNo);
		logger.info("내가 찜한 코스 화면 보여주기, 파라미터  searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.NA_BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.MY_NA_RECORD_COUNT_PER_PAGE);
		
		searchVo.setRecordCountPerPage(CommonConstants.MY_NA_RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list=heartService.myCourseList(searchVo);
		logger.info("내가 찜한 코스 list.size={}", list.size());
		
		int totalRecord=heartService.getTotalRecord(searchVo);
		logger.info("내가 찜한 코스 totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "myPage/myCourse/myCourseList";
	}
	
}
