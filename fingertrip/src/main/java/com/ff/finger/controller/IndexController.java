package com.ff.finger.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.visitors.model.VisitorsService;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class); 
	
	@Autowired
	private VisitorsService visitorsService;
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request) {
		logger.info("메인화면 보여주기");
		
		String ip=request.getRemoteAddr();
		logger.info("ip={}", ip);
		
		int cnt=visitorsService.selectTodayCnt();
		logger.info("방문자 테이블 조회 후cnt={}", cnt);
		
		if(cnt<=0) {
			cnt=visitorsService.insertInit();
			logger.info("방문자 테이블 insert 후 cnt={}", cnt);
		}
		
		cnt=visitorsService.selectTodayIp(ip);
		logger.info("오늘 ip 중복 조회 후 , cnt={}", cnt);
		
		if(cnt<=0) {
			cnt=visitorsService.updateCnt(ip);
			logger.info("방문자 cnt update 후, cnt={}", cnt);
		}
		
		return "index";
	}
	
}
