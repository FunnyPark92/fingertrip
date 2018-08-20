package com.ff.finger.agencypage.controller;

import java.util.Calendar;
import java.util.Date;
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

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.cs.QnA.model.QnAVO;
import com.ff.finger.travelAgency.model.TravelAgencyService;
import com.ff.finger.travelAgency.model.TravelAgencyVO;

import com.ff.finger.bid.model.BidService;
import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.travelAgency.model.TravelAgencyService;
import com.ff.finger.winBid.model.WinBidService;

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
	
	@Autowired
	private WinBidService winBidService;
	
	@RequestMapping("/bidList.do")
	public String bidList(HttpSession session,Model model) {
		String agencyId = (String) session.getAttribute("agencyid");
		logger.info("입찰한 목록 화면 보여주기 파라미터, agencyId={}", agencyId);
		
		List<Map<String, Object>> bidList = bidService.selectMyBidList(agencyId);
		logger.info("입찰한 목록 검색 결과, bidList.size={}", bidList.size());
		logger.info("입찰한 목록 검색 결과, bidList={}", bidList);
		
		for (int i=0; i<bidList.size(); i++) {
			System.out.println("입찰시작일: " + (Date) bidList.get(i).get("BID_START_DAY"));
			
			Date today = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime((Date) bidList.get(i).get("BID_START_DAY"));
			cal.add(Calendar.DATE, 3);
			
			bidList.get(i).put("BID_END_DAY", cal.getTime().toLocaleString());
			if (cal.getTime().compareTo(today) >= 0) {
				bidList.get(i).put("BID_STATUS", "입찰 진행 중");
			} else {
				int cnt = winBidService.checkWinByBidNo(Integer.parseInt(String.valueOf(bidList.get(i).get("BID_NO"))));
				logger.info("낙찰 성공 여부 조회 결과, cnt={}", cnt);
				
				if (cnt > 0) {
					bidList.get(i).put("BID_STATUS", "낙찰 성공");
				} else {
					bidList.get(i).put("BID_STATUS", "낙찰 실패");
				}
			}
		}
		
		model.addAttribute("list", bidList);
		
		return "agencyPage/bidList";
	}

	@RequestMapping("/myWriteList.do")
	public String myWriteList(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
		String agencyId =  (String) session.getAttribute("agencyid");
		logger.info("기업 내가쓴 글 화면 보여주기 파라미터, agencyId={}", agencyId);
		
		//기업 ID로 기업 정보 불러오기
		TravelAgencyVO TravelAgencyVo=travelAgencyService.getAgencyVo(agencyId);
		//기업 번호 불러오기
		int travelAgencyNo=TravelAgencyVo.getTravelAgencyNo();
		//기업 번호를 serchVo에 memberNo로 저장한 다음에 쿼리문에서 TravelAgencyNo=#{memberNo}로 사용하면 같은 기능을함
		//serchVo가 memberVO만 extends하기 때문이 이런 방법으로 진행
		searchVo.setMemberNo(travelAgencyNo); 
		
		//페이징 처리를 위한 공간
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		//QnA처리
		logger.info("기업이 쓴 QnA 목록 파라미터, searchVo={}", searchVo);
		List<QnAVO> list=qnAService.agencyWrite(searchVo);
		
		int QnAtotalRecord=qnAService.agencyWritetotalRecord(searchVo);
		logger.info("QnA totalRecord={}", QnAtotalRecord);
		pagingInfo.setTotalRecord(QnAtotalRecord);
		
		//디테일에서 처리를 위한 변수 
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo", pagingInfo);	
		
		return "agencyPage/myWriteList";
	}
}
