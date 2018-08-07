package com.ff.finger.admin.controller;

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

import com.ff.finger.bid.model.BidService;
import com.ff.finger.bid.model.BidVO;
import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.course.model.CourseService;
import com.ff.finger.course.model.CourseVO;

@Controller
@RequestMapping("/admin/nacojja/bid")
public class AdminBidController {
	private Logger logger=LoggerFactory.getLogger(AdminBidController.class);
	
	@Autowired 
	private BidService bidService;
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/bidList.do")
	public String nacojjaList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("관리자 입찰관리, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<Map<String, Object>> list=bidService.selectBidList(searchVo);
		logger.info("입찰관리 list.size={}", list.size());
		
		int totalRecord=bidService.totalRecord(searchVo);
		logger.info("입찰관리 목록 totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/nacojja/bid/bidList";
	}
	
	@RequestMapping("/bidDetail.do")
	public String bidDetail(@RequestParam(defaultValue="0") int courseNo, Model model) {
		logger.info("입찰조회 상세보기, courseNo={}", courseNo);
		
		if(courseNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/nacojja/bid/bidList.do");
			
			return "common/message";
		}
		
		Map<String, Object> map=courseService.selectCourseProgress(courseNo);
		logger.info("코스 조회 후 map={}", map);
		
		List<Map<String, Object>> list=bidService.selectByNo(courseNo);
		logger.info("입찰 조회 후, list.size={}", list.size());
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "admin/nacojja/bid/bidDetail";
	}
}
