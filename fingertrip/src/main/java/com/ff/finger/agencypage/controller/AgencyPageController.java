package com.ff.finger.agencypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.common.SearchVO;
import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.travelAgency.model.TravelAgencyService;
import com.ff.finger.travelAgency.model.TravelAgencyVO;

import com.ff.finger.bid.model.BidService;

@Controller
@RequestMapping("/agencyPage")
public class AgencyPageController {
	private static final Logger logger = LoggerFactory.getLogger(AgencyPageController.class);
	
	@Autowired
	private QnAService qnAService;
	
	@Autowired
	private TravelAgencyService travelAgencyService; 
	
	@Autowired
	private BidService bidService;
	
	@RequestMapping("/bidList.do")
	public String bidList(HttpSession session,Model model) {
		String agencyId = (String) session.getAttribute("agencyid");
		logger.info("입찰한 목록 화면 보여주기 파라미터, agencyId={}", agencyId);
		
		List<Map<String, Object>> bidList = bidService.selectMyBidList(agencyId);
		logger.info("입찰한 목록 검색 결과, bidList.size={}", bidList.size());
		
		model.addAttribute("list", bidList);
		
		return "agencyPage/bidList";
	}

	/*@RequestMapping("/myWriteList.do")
	public String myWriteList(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
		String agencyId =  (String) session.getAttribute("agencyid");
		logger.info("기업 내가쓴 글 화면 보여주기 파라미터, agencyId={}", agencyId);
		
		//기업 ID로 기업 정보 불러오기
		TravelAgencyVO TravelAgencyVo=travelAgencyService.getAgencyVo(agencyId);
		
		//기업 번호 불러오기
		int agencyNo=memberVo.getMemberNo();
		searchVo.setMemberNo(memberNo); //member를 상속받은 searchVo에 저장해둔 memberNo셋팅
		
	}*/
}
