package com.ff.finger.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.coupon.model.CouponListVO;
import com.ff.finger.coupon.model.CouponService;
import com.ff.finger.coupon.model.CouponVO;
import com.ff.finger.course.model.CourseService;
import com.ff.finger.course.model.CourseVO;
import com.ff.finger.heart.model.HeartService;
import com.ff.finger.heart.model.HeartVO;

@Controller
@RequestMapping("/admin/nacojja/coupon")
public class AdminCouponController {
	private static final Logger logger=LoggerFactory.getLogger(AdminCouponController.class);
	
	@Autowired 
	public CourseService courseService;
	@Autowired 
	public HeartService heartService;
	@Autowired 
	public CouponService couponService;
	
	@RequestMapping("/couponList.do")
	public String couponList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("관리자 회원혜택관리 목록, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<CourseVO> list=courseService.selectProgress(searchVo);
		logger.info("목록 조회 후 list.size={}", list.size());
		
		int totalRecord=courseService.getTotalRecordByPrgs(searchVo);
		logger.info("목록 totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		List<String> cpList=new ArrayList<>();
		int courseNo=0, count=0, j=0, heartNo=0, cnt=0;
		List<HeartVO> hList =new ArrayList<>();
		for(int i=0;i<list.size();i++) {
			courseNo=list.get(i).getCourseNo();
			logger.info("코스 번호, courseNo={}", courseNo);
			
			hList =heartService.selectByCourse(courseNo);	//번호->하트리스트 (하트개수)
			logger.info("하트 리스트, hList.size()={}", hList.size());
			
			count=0;
			for(j=0;j<hList.size();j++) {
				heartNo=hList.get(j).getHeartNo();
				logger.info("하트 번호, heartNo={}", heartNo);
				
				cnt=couponService.selectByHeart(heartNo);	//하트->쿠폰유무
				logger.info("쿠폰 cnt={}", cnt);
				if(cnt>0) {
					count++;
				}else {
					break;
				}
			}
			
			if(count==hList.size()) {
				cpList.add(i, "O");
				logger.info("완료! count={}, hList.size={}", count, hList.size());
			}else {
				cpList.add(i, "X");
				logger.info("미완료! count={}, hList.size={}", count, hList.size());
			}
		}
		
		model.addAttribute("cpList", cpList);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		return "admin/nacojja/coupon/couponList";
	}
	
	@RequestMapping("/couponDetail.do")
	public String couponDetail(@RequestParam(defaultValue="0") int courseNo, Model model) {
		logger.info("관리자 회원혜택관리 상세보기, courseNo={}",courseNo);
		
		Map<String, Object> map=courseService.selectMember(courseNo);
		logger.info("코스 조회 후 map={}", map);
		
		Map<String, Object> map2=new HashMap<>();
		map2.put("find", 0);
		map2.put("courseNo", courseNo);
		List<Map<String, Object>> list1=couponService.selectHeartMemberCoupon(map2);
		logger.info("등록자 조회 후 list1.size={}", list1.size());
		
		map2.remove("find");
		map2.put("find", 1);
		List<Map<String, Object>> list2=couponService.selectHeartMemberCoupon(map2);
		logger.info("쿠폰회원 목록 조회 후 list2.size={}", list2.size());

		List<CouponVO> cList=couponService.selectAll();
		logger.info("쿠폰 종류 cList.size={}", cList.size());
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("cList", cList);
		model.addAttribute("map", map);
		
		return "admin/nacojja/coupon/couponDetail";
	}
}
