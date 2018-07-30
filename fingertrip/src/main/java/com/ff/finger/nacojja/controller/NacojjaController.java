package com.ff.finger.nacojja.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ff.finger.common.SearchVO;
import com.ff.finger.country.model.CountryService;
import com.ff.finger.course.model.CourseService;

@Controller
@RequestMapping("/nacojja")
public class NacojjaController {
	private static final Logger logger = LoggerFactory.getLogger(NacojjaController.class);
	
	@Autowired 
	private CourseService courseService;
	
	@Autowired
	private CountryService countryService;
	
	@RequestMapping("/nacojjaList.do")
	public String nacojjaList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("나코짜 목록 보여주기, 파라미터 searchVo={}", searchVo);
		
		List<Map<String,Object>> list=courseService.nacojjaList(searchVo);
		logger.info("나코짜 목록 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		return "nacojja/nacojjaList";
	}
	
	@RequestMapping(value = "/nacojja1.do", method = RequestMethod.GET)
	public String nacojja1Write_get() {
		logger.info("나코짜 작성화면1 보여주기");
		
		return "nacojja/nacojja1";
	}
	
	@RequestMapping(value = "/nacojja1.do", method = RequestMethod.POST)
	public String nacojja1Write_post() {
		logger.info("나코짜 작성화면1 DB 처리하기");
		
		return "nacojja/nacojja2";
	}
	
	@RequestMapping(value = "/nacojja2.do", method = RequestMethod.GET)
	public String nacojja2Write_get(Model model) {
		logger.info("나코짜 작성화면2 보여주기");
		
		/*List<CountryVO> list = countryService.selectAllCountry();
		logger.info("국가 리스트 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);*/
		
		return "nacojja/nacojja2";
	}
	
}
