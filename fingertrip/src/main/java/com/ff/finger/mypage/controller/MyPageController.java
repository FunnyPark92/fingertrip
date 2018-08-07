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
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.coupon.model.CouponService;
import com.ff.finger.course.model.CourseService;
import com.ff.finger.course.model.CourseVO;
import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.cs.QnA.model.QnAVO;
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
	@Autowired 
	private CouponService couponService;
	@Autowired
	private QnAService qnAService;
	@Autowired
	private CourseService courseService;

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
	public String heartCharge(HttpSession session, Model model) {
		logger.info("하트 화면 보여주기");

		String userid =  (String) session.getAttribute("userid");
		MemberVO memberVo = memberService.logingMember(userid);
		
		model.addAttribute("memberVo", memberVo);
		
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
	
	@RequestMapping("/myWrite/myWriteList.do")
	public String myWriteList(@ModelAttribute SearchVO searchVo, @RequestParam(defaultValue="1") int currentPageforCourse, HttpSession session, Model model) {
		//로그인때 session에 저장된 userid로 회원정보를 가져오기+memberNo를 getter로 받아오기
		String userid=(String)session.getAttribute("userid");
		MemberVO memberVo=memberService.logingMember(userid); 
		int memberNo=memberVo.getMemberNo();  
		searchVo.setMemberNo(memberNo); //member를 상속받은 searchVo에 저장해둔 memberNo셋팅
		
		//QnA페이징
		PaginationInfo pagingInfoQnA=new PaginationInfo();
		pagingInfoQnA.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfoQnA.setCurrentPage(searchVo.getCurrentPage());
		pagingInfoQnA.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfoQnA.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(5);
		//따로 페이지를 처리하기 위한 변수 선언
		int QnAcur=searchVo.getCurrentPage();
		
		//내가쓴 QnA를 처리 하기 위한 공간
		logger.info("내가 쓴 QnA 목록 파라미터, searchVo={}", searchVo);
		logger.info("내가 쓴 코스 목록 파아미터 currentPageforCourse={}", currentPageforCourse);

		List<QnAVO> list=qnAService.myWriteSelectAll(searchVo);
		logger.info("내가 쓴 QnA 화면 목록 조회 결과, list.size={}",list.size());
		
		int myWriteQnAtotalRecord=qnAService.myWriteQnAtotalRecord(searchVo);
		logger.info("myWriteQnAtotalRecord={}", myWriteQnAtotalRecord);
		pagingInfoQnA.setTotalRecord(myWriteQnAtotalRecord);
		
		//여행코스 페이징
		PaginationInfo pagingInfoCourse=new PaginationInfo();
		pagingInfoCourse.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfoCourse.setCurrentPage(currentPageforCourse);
		pagingInfoCourse.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfoCourse.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(5);
		
		//내가 쓴 여행코스를 처리 하기 위한 공간
		logger.info("내가 쓴 QnA 목록 파라미터, searchVo={}", searchVo);
		logger.info("내가 쓴 코스 목록 파아미터 currentPageforCourse={}", currentPageforCourse);
		searchVo.setCurrentPage(currentPageforCourse);
		
		List<CourseVO> listC=courseService.myWriteSelectAll(searchVo);
		logger.info("내가 쓴 Course 화면 목록 조회 결과, listC.size={}", listC.size());
		
		int myWriteCoursetotalRecord=courseService.myWriteCoursetotalRecord(searchVo);
		logger.info("myWriteCoursetotalRecord={}", myWriteCoursetotalRecord );
		pagingInfoCourse.setTotalRecord(myWriteCoursetotalRecord);
		
	    //myWriteList.jsp로 포워딩 
		model.addAttribute("QnAcur", QnAcur);
		model.addAttribute("QnAlist", list);
		model.addAttribute("pagingInfoQnA", pagingInfoQnA);
		model.addAttribute("CourseList", listC);
		model.addAttribute("pagingInfoCourse", pagingInfoCourse);
		
		return "myPage/myWrite/myWriteList";
	}
}
