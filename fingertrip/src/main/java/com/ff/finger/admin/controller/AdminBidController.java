package com.ff.finger.admin.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.bid.model.BidService;
import com.ff.finger.bid.model.BidVO;
import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.course.model.CourseService;
import com.ff.finger.winBid.model.WinBidService;

@Controller
@RequestMapping("/admin/nacojja/bid")
public class AdminBidController {
	private static final Logger logger=LoggerFactory.getLogger(AdminBidController.class);
	
	@Autowired 
	private BidService bidService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private WinBidService winBidService;
	
	@RequestMapping("/bidList.do")
	public String nacojjaList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("관리자 입찰관리, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<Map<String, Object>> list=bidService.selectBidList(searchVo);
		logger.info("입찰조회 목록 list.size={}", list.size());
		
		int totalRecord=bidService.totalRecord(searchVo);
		logger.info("입찰조회 목록 totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		String cNo="", pNo="";
		int courseNo=0, compare=0, cnt2=0, cnt=0;
		List<Map<String, Object>> list2=new ArrayList<>();
		Map<String, Object> map2 =new HashMap<>();	//진행상태변경
		Map<String, Object> map3 =new HashMap<>();	//낙찰선정
		map2.clear();
		map3.clear();
		Date today = new Date();
		Date bidEndDay = new Date();
		Date bidEndDay2 = new Date();
		BidVO bidVo=new BidVO();
		for(int i=0;i<list.size();i++) {
			cNo=list.get(i).get("COURSE_NO").toString();
			courseNo=Integer.parseInt(cNo);
			pNo=list.get(i).get("PROGRESS_NO").toString();
			logger.info("입찰관리 courseNo={}, 진행상태 pNo={}",courseNo, pNo);
			
			list2=bidService.selectByNo(courseNo);
			logger.info("입찰 조회 후, list2.size={}", list2.size());
			
			if(pNo.equals("2")){
				bidEndDay=(Date)list.get(i).get("BID_END_DAY");
				Calendar cal=new GregorianCalendar(Locale.KOREA);
				cal.setTime(bidEndDay);
				cal.add(Calendar.DAY_OF_YEAR, 1);
				bidEndDay2=cal.getTime();
				compare=today.compareTo(bidEndDay2);
				
				logger.info("날짜 비교, today={}, bidEndDay={}", today, bidEndDay);
				logger.info("날짜 비교, bidEndDay2={}, compare={}", bidEndDay2, compare);
				
				if(compare>0) {
					if(list2.size()>0) {
						map2.put("progressNo", 3);
						logger.info("진행상태 3");

						bidVo=bidService.selectWin(courseNo);
						logger.info("낙찰 조회 후, bidVo={}", bidVo);
						
						map3.put("bidPrice", bidVo.getBidPrice());
						map3.put("bidNo", bidVo.getBidNo());
						cnt2=winBidService.insertWin(map3);
						if(cnt2>0) {
							logger.info("낙찰 선정 완료 cnt2={}", cnt2);
						}else {
							logger.info("낙찰 선정 실패 cnt2={}", cnt2);
						}

					}else {
						map2.put("progressNo", 4);
						logger.info("진행상태 4");
					}
					map2.put("courseNo", courseNo);
					
					cnt=courseService.updateProgress(map2);
					logger.info("진행상태 변경 후 ,cnt={}", cnt);
					
				}
			}
			
		}
		
		list=bidService.selectBidList(searchVo);
		logger.info("입찰관리 재조회 후 list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/nacojja/bid/bidList";
	}
	
	@RequestMapping("/bidDetail.do")
	public String bidDetail(@RequestParam(defaultValue="0") int courseNo, Model model) {
		logger.info("입찰조회 상세보기, courseNo={}", courseNo);
		
		if(courseNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/nacojja/bid/bidList.do");
			
			return "common/message";
		}
		
		Map<String, Object> map=courseService.selectCourseProgress(courseNo);
		logger.info("코스 조회 후 map={}", map);
		
		List<Map<String, Object>> list=bidService.selectByNo(courseNo);
		logger.info("입찰 조회 후, list.size={}", list.size());
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "admin/nacojja/bid/bidDetail";
	}
	
}
