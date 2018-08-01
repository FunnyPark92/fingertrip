package com.ff.finger.travelAgency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AgencyListController {
	private static final Logger logger = LoggerFactory.getLogger(AgencyListController.class); 
	
	
	@RequestMapping("/admin/agency/agencyList.do")
	public String agencyList() {
		logger.info("여행사 리스트");
		
		return "admin/agency/agencyList";
	}
	
	
	
	
}
