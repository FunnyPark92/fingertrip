package com.ff.finger.agencypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/agencyPage")
public class AgencyPageController {
	private static final Logger logger = LoggerFactory.getLogger(AgencyPageController.class);
	
	@RequestMapping("/bidList.do")
	public String bidList(HttpSession session,Model model) {
		String agencyId =  (String) session.getAttribute("agencyid");
		logger.info("입찰한 목록 화면 보여주기 파라미터, agencyId={}", agencyId);
		
		//List<Map<String, Object>> bidList = .selectCouponView(agencyId);
		//logger.info("입찰한 목록 검색 결과 list.size={}", bidList.size());
		
		//model.addAttribute("list", bidList);
		
		return "agencyPage/bidList";
	}
	
	
	
}
