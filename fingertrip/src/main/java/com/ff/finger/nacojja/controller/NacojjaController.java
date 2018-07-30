package com.ff.finger.nacojja.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.country.model.CountryService;
import com.ff.finger.country.model.CountryVO;

@Controller
public class NacojjaController {
	private static final Logger logger = LoggerFactory.getLogger(NacojjaController.class);
	
	@Autowired
	private CountryService countryService;
	
	@RequestMapping("/nacojja/nacojjaList.do")
	public String nacojjaList() {
		logger.info("나코짜 목록 보여주기");
		
		return "nacojja/nacojjaList";
	}
	
	@RequestMapping("/nacojja/nacojja1.do")
	public String nacojja1() {
		logger.info("나코짜 작성화면1 보여주기");
		
		return "nacojja/nacojja1";
	}
	
	@RequestMapping("/nacojja/nacojja2.do")
	public String nacojja2(Model model) {
		logger.info("나코짜 작성화면2 보여주기");
		
		/*List<CountryVO> list = countryService.selectAllCountry();
		logger.info("국가 리스트 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);*/
		
		return "nacojja/nacojja2";
	}
	
}
