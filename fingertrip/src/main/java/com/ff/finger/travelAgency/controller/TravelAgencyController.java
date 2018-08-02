package com.ff.finger.travelAgency.controller;

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

import com.ff.finger.travelAgency.model.TravelAgencyService;
import com.ff.finger.travelAgency.model.TravelAgencyVO;




@Controller
@RequestMapping("/admin")
public class TravelAgencyController {
	private static final Logger logger = LoggerFactory.getLogger(TravelAgencyController.class); 
	
	@Autowired
	TravelAgencyService travelAgencyServise;
	
	@RequestMapping("/agency/agencyWrite.do")
	public String agencyWrite() {
		logger.info("여행사 회원 가입 화면");
		
		return "admin/agency/agencyWrite";
	}
	
	@RequestMapping("/agency/agencyRegister.do")
	public String agencyRegister(@ModelAttribute TravelAgencyVO vo,Model model) {
		logger.info("여행사 회원 가입 처리 TravelAgencyVO={}",vo);
		
		int cnt = travelAgencyServise.insertAgency(vo);
		logger.info("inset 결과 cnt={}",cnt);
		String msg ="", url="";
		if(cnt>0) {
			msg="여행사 회원 가입 완료";
			url="/admin/adminLogin.do";
		}else {
			msg="회원 가입 실패";
			url="/agency/agencyWrite.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminIdCheck.do")
	@ResponseBody
	public boolean idcheck(@RequestParam String id){
		logger.info("아이디 중복확인 id={}",id);
		
		boolean result = travelAgencyServise.idDuplicate(id);
		logger.info("중복 확인결과 result={}",result);
		
		return result;
	}
	
	@RequestMapping("/adminNameCheck.do")
	@ResponseBody
	public boolean namecheck(@RequestParam String name){
		logger.info("상호명 중복확인 id={}",name);
		
		boolean result = travelAgencyServise.nameDuplicate(name);
		logger.info("중복 확인결과 result={}",result);
		
		return result;
	}
	
	
	@RequestMapping("/agency/agencyList.do")
	public String agencyList(Model model) {
		logger.info("여행사 리스트");
		
		List<TravelAgencyVO> list = travelAgencyServise.selectAgency();
		logger.info("여행사 리스트 list={}",list);
		
		model.addAttribute("list",list);
		
		return "admin/agency/agencyList";
		
	}
	
	@RequestMapping("/agency/agencyEdit.do")
	public String agencyEdit() {
		logger.info("여행사 수정");
		
		return "admin/agency/agencyEdit";
	}
	
	@RequestMapping("/agency/agencyDetail.do")
	public String agencyDetail() {
		logger.info("여행사 자세히보기");
		
		return "admin/agency/agencyDetail";
	}

	@RequestMapping("/agency/licenseCheck.do")
	public String licenseCheck(){
		logger.info("중복찾기 화면");
		return "admin/agency/licenseCheck";
	}
	
	@ResponseBody
	@RequestMapping("/agency/checkLc.do")
	public boolean licenseCheck_post(@RequestParam String licenseNo,Model model) {
		logger.info("중복확인 처리 licenseNo={}",licenseNo);
		String msg="", url="/admin/agency/licenseCheck.do";
		boolean result =travelAgencyServise.checkLicenseNoDupl(licenseNo);
		logger.info("중복확인 결과 result={}",result);
		return result;
	}
	
	
}
