package com.ff.finger.travelAgency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelAgencyController {
	private static final Logger logger = LoggerFactory.getLogger(TravelAgencyController.class); 
	
	@RequestMapping("/admin/agency/agencyWrite.do")
	public String agencyWrite() {
		logger.info("여행사 회원 가입");
		
		return "admin/agency/agencyWrite";
	}
	
	@RequestMapping("/admin/agency/agencyList.do")
	public String agencyList() {
		logger.info("여행사 리스트");
		
		return "admin/agency/agencyList";
	}
	
	@RequestMapping("/admin/agency/agencyEdit.do")
	public String agencyEdit() {
		logger.info("여행사 수정");
		
		return "admin/agency/agencyEdit";
	}
	
	@RequestMapping("/admin/agency/agencyDetail.do")
	public String agencyDetail() {
		logger.info("여행사 자세히보기");
		
		return "admin/agency/agencyDetail";
	}
	
	
}
