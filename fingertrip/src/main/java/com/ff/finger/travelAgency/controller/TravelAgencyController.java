package com.ff.finger.travelAgency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class TravelAgencyController {
	private static final Logger logger = LoggerFactory.getLogger(TravelAgencyController.class); 
	
	@RequestMapping("/agency/agencyWrite.do")
	public String agencyWrite() {
		logger.info("여행사 회원 가입 화면");
		
		return "admin/agency/agencyWrite";
	}
	/*@RequestMapping(value="/agency/agencyWrite.do", method=RequestMethod.POST)
	public String agencyWrite_post() {
		logger.info("여행사 회원 가입 처리");
		
		return "admin/agency/agencyWrite";
	}*/
	
	@RequestMapping("/agency/agencyList.do")
	public String agencyList() {
		logger.info("여행사 리스트");
		
		return "admin/agency/agencyList";
	}
	
	
	
}
