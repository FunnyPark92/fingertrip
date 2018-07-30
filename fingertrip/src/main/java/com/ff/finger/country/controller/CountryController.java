package com.ff.finger.country.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.country.model.CountryService;
import com.ff.finger.country.model.CountryVO;

@Controller
public class CountryController {
	private static final Logger logger = LoggerFactory.getLogger(CountryController.class);
	
	@Autowired
	private CountryService countryService;
	
	@RequestMapping("/country.do")
	public String countryList(@RequestParam int continentNo, @RequestParam String continent, Model model) {
		logger.info("국가 리스트 처리 전 파라미터, continentNo={}, continent={}", continentNo, continent);
		
		List<CountryVO> list = countryService.selectSomeCountry(continentNo);
		logger.info("특정 국가 리스트 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/nacojja/nacojja2";
	}
}
