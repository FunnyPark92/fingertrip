package com.ff.finger.country.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ff.finger.country.model.CountryService;
import com.ff.finger.country.model.CountryVO;
import com.ff.finger.travelspot.model.TravelSpotVO;

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
		if (continent.equals("asia")) {
			continentNo = 1;
		} else if (continent.equals("europe")) {
			continentNo = 2;
		} else if (continent.equals("oceania")) {
			continentNo = 3;
		} else if (continent.equals("america")) {
			continentNo = 4;
		} else if (continent.equals("africa")) {
			continentNo = 5;
		}
		
		List<CountryVO> list = countryService.selectSomeCountry(continentNo);
		logger.info("{} 대륙에 속한 국가 리스트 조회 결과, list.size()={}", continent, list.size());
		
		return list;
	}
	
	/*@RequestMapping("/country.do")
	public String countryList(@ModelAttribute TravelSpotVO travelSpotVo, @RequestParam String continent, Model model) {
		logger.info("국가 리스트 처리 전 파라미터, travelSpotVo={}", travelSpotVo);
		logger.info("국가 리스트 처리 전 파라미터, continent={}", continent);
		
		int continentNo = 0;
		if (continent.equals("asia")) {
			continentNo = 1;
		} else if (continent.equals("europe")) {
			continentNo = 2;
		} else if (continent.equals("oceania")) {
			continentNo = 3;
		} else if (continent.equals("america")) {
			continentNo = 4;
		} else if (continent.equals("africa")) {
			continentNo = 5;
		}
		
		List<CountryVO> list = countryService.selectSomeCountry(continentNo);
		logger.info("특정 국가 리스트 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("travelSpotVo", travelSpotVo);
		
		return "/nacojja/nacojja2";
	}*/
}
