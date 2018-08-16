package com.ff.finger.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.travelAgency.model.AgencyListVO;
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
			url="/admin/agency/agencyList.do";
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
		logger.info("상호명 중복확인 name={}",name);
		
		boolean result = travelAgencyServise.nameDuplicate(name);
		logger.info("중복 확인결과 result={}",result);
		
		return result;
	}
	
	
	
	@RequestMapping("/agency/agencyList.do")
	public String agencyList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("여행사 리스트 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.AGENCY_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.AGENCY_PER_PAGE);
		
		
		List<TravelAgencyVO> list = travelAgencyServise.selectAgency(searchVo);
		logger.info("여행사 리스트 list={}",list.size());
		
		int agencyTotalRecode=travelAgencyServise.totalRecord(searchVo);
		logger.info("agency totalRecord={}", agencyTotalRecode);
		pagingInfo.setTotalRecord(agencyTotalRecode);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "admin/agency/agencyList";
		
	}
	

	@RequestMapping(value="/agency/agencyEdit.do", method=RequestMethod.GET)
	public String agencyEdit(@RequestParam String name,Model model) {
		logger.info("여행사 수정 name={}", name);
		TravelAgencyVO vo =travelAgencyServise.selectOneAgency(name);
		/*String[] aa = vo.getHp().split("-");
		String hp1="", hp2="", hp3="";
		for(String ss : aa) {
			
		}*/
		model.addAttribute("vo",vo);

		
		return "admin/agency/agencyEdit";
	}
	@RequestMapping(value="/agency/agencyEdit.do", method=RequestMethod.POST)
	public String agencyEdit_post(@ModelAttribute TravelAgencyVO vo,Model model) {
		logger.info("기업회원 수정하기  vo={}",vo);
		
		int cnt = travelAgencyServise.updateAgency(vo);
		
		String msg="", url="";
		if(cnt>0) {
			msg="기업회원수정이 완료되었습니다.";
			url="/admin/agency/agencyList.do";
		}else {
			msg="기업회원수정이 실패";
			url="/admin/agency/agencyEdit.do";
			
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/agency/agencyDetail.do")
	public String agencyDetail(@RequestParam String name,Model model) {
		logger.info("여행사 자세히보기 name ={}",name);
		TravelAgencyVO vo = travelAgencyServise.selectOneAgency(name);
		
		model.addAttribute("vo",vo);
		
		return "admin/agency/agencyDetail";
	}

/*	@RequestMapping("/agency/licenseCheck.do")
	public String licenseCheck(){
		logger.info("중복찾기 화면");
		
		return "admin/agency/licenseCheck";
	}*/
	
	@ResponseBody
	@RequestMapping("/agency/checkLc.do")
	public boolean licenseCheck_post(@RequestParam String licenseNo,Model model) {
		logger.info("중복확인 처리 licenseNo={}",licenseNo);
		
		//String msg="", url="/admin/agency/licenseCheck.do";
		
		boolean result =travelAgencyServise.checkLicenseNoDupl(licenseNo);
		logger.info("중복확인 결과 result={}",result);
		
		return result;
	}
	
	@RequestMapping("/agency/deleteAgency.do")
	public String deleteAgency(@ModelAttribute AgencyListVO listVo,Model model) {
		logger.info("agency delete, agencyVo={}",listVo);
		int cnt = travelAgencyServise.multiDelete(listVo.getAgencyItems());
		logger.info("다중 삭제 결과  cnt={}",cnt);

		String msg="", url="/admin/agency/agencyList.do";
		if(cnt>0) {
			msg="삭제가 완료되었습니다";
		}else {
			msg="삭제 실패!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/agency/agencyDelete.do")
	public String deleteOne(@RequestParam int travelAgencyNo,Model model) {
		logger.info("단일 삭제 travelAgencyNo={}",travelAgencyNo);
		int cnt =travelAgencyServise.deleteAgency(travelAgencyNo);
		
		String msg="", url="";
		if(cnt>0) {
			msg="삭제가 완료 되었습니다.";
			url="/admin/agency/agencyList.do";
		}else {
			msg="삭제 실패!";
			url="/admin/agency/agencyDetail.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}










