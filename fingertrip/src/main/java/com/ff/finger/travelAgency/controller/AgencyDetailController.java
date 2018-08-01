package com.ff.finger.travelAgency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AgencyDetailController {
	private static final Logger logger = LoggerFactory.getLogger(AgencyDetailController.class); 
	
	
	@RequestMapping("/admin/agency/agencyDetail.do")
	public String agencyDetail() {
		logger.info("여행사 자세히보기");
		
		return "admin/agency/agencyDetail";
	}
	
	
	
	
}
