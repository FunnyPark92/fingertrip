package com.ff.finger.travelAgency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AgencyEditController {
	private static final Logger logger = LoggerFactory.getLogger(AgencyEditController.class); 
	
	@RequestMapping("/admin/agency/agencyEdit.do")
	public String agencyEdit() {
		logger.info("여행사 수정");
		
		return "admin/agency/agencyEdit";
	}
	
	
	
}
