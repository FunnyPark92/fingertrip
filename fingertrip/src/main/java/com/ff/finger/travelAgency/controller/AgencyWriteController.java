package com.ff.finger.travelAgency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AgencyWriteController {
	private static final Logger logger = LoggerFactory.getLogger(AgencyWriteController.class); 
	
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
	
	
	
}
