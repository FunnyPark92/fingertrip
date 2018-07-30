package com.ff.finger.nacojja.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.FileUploadUtil;
import com.ff.finger.common.SearchVO;
import com.ff.finger.country.model.CountryService;
import com.ff.finger.course.model.CourseService;
import com.ff.finger.course.model.CourseVO;

@Controller
@RequestMapping("/nacojja")
public class NacojjaController {
	private static final Logger logger = LoggerFactory.getLogger(NacojjaController.class);
	
	@Autowired 
	private CourseService courseService;
	
	@Autowired
	private CountryService countryService;
	
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
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
		logger.info("나코짜1 작성화면 보여주기");
		
		return "nacojja/nacojja1";
	}
	
	@RequestMapping(value = "/nacojja1.do", method = RequestMethod.POST)
	public String nacojja1Write_post(@ModelAttribute CourseVO courseVo, HttpServletRequest request) {
		logger.info("나코짜1 DB 처리하기, 파라미터 courseVo={}", courseVo);
		
		//파일 업로드 처리
		String fileName = "";
		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, CommonConstants.PATH_FLAG_IMAGE);

			for (Map<String, Object> map : fileList) {
				fileName = (String) map.get("fileName");
			}
			courseVo.setThumbImg(fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("나코짜1 파일 업로드 처리 후, courseVo={}", courseVo);
		
		int cnt = courseService.nacojja1Write(courseVo);
		logger.info("나코짜1 DB 등록 결과, cnt={}", cnt);
		
		return "nacojja/nacojja2";
	}
	
	@RequestMapping(value = "/nacojja2.do", method = RequestMethod.GET)
	public String nacojja2Write_get(Model model) {
		logger.info("나코짜2 작성화면 보여주기");
		
		/*List<CountryVO> list = countryService.selectAllCountry();
		logger.info("국가 리스트 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);*/
		
		return "nacojja/nacojja2";
	}
	
}
