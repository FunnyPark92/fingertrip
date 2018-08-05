package com.ff.finger.country.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ff.finger.country.model.CountryService;
import com.ff.finger.country.model.CountryVO;

@Controller
public class CountryController {
	private static final Logger logger = LoggerFactory.getLogger(CountryController.class);
	
	@Autowired
	private CountryService countryService;
	
	@RequestMapping("/country.do")
	@ResponseBody
	public List<CountryVO> countryList(@RequestParam String continent) {
		logger.info("국가 리스트 처리 전 파라미터, continent={}", continent);
		
		int continentNo = 0;
		switch (continent) {
		case "asia":
			continentNo = 1; break;
		case "middleEast":
			continentNo = 2; break;
		case "europe":
			continentNo = 3; break;
		case "northAmerica":
			continentNo = 4; break;
		case "latinAmerica":
			continentNo = 5; break;
		case "africa":
			continentNo = 6; break;
		case "oceania":
			continentNo = 7; break;
		}
		
		List<CountryVO> list = countryService.selectSomeCountry(continentNo);
		logger.info("{} 대륙에 속한 국가 리스트 조회 결과, list.size()={}", continent, list.size());
		
		return list;
	}
	
}
