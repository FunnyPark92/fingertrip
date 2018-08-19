package com.ff.finger.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.ff.finger.course.model.CourseService;
import com.ff.finger.cs.QnA.model.QnAVO;
import com.ff.finger.travelspot.model.TravelSpotVO;
import com.ff.finger.winBid.model.WinBidService;

@Controller
@RequestMapping("/admin/nacojja") 
public class AdminNacojjaController {
	private static final Logger logger=LoggerFactory.getLogger(AdminNacojjaController.class);
	
	@Autowired 
	CourseService courseService;
	
	@RequestMapping("/nacojjaList.do")
	public String nacojjaList (@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("admin 나코짜코스 목록 파라미터 SearchVO={}", searchVo);
		
		//페이징 처리를 위한 공간
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<Map<String, Object>> list=courseService.selectListJoinMember(searchVo);
		logger.info("admin 나코짜목록보기 조회결과 List={}", list);
		
		int totalRecord=courseService.getTotalRecord(searchVo);
		logger.info("나코짜조회 목록 totalRecord={}", totalRecord);	
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/nacojja/nacojjamanager/nacojjaList";
	}
	
	@RequestMapping("/nacojjaDetail.do")
	public String nacojjaDetail(@RequestParam(defaultValue="0")int courseNo, Model model) {
		logger.info("admin 나코짜상세보기 파라미터 courseNo={}", courseNo);
		
		if(courseNo==0) {
			model.addAttribute("msg","잘못됫 url입니다.");
			model.addAttribute("url","/admin/nacojja/nacojjaList.do");
			return "common/message"; 
		}
		
		List<TravelSpotVO> list=courseService.selectTravelSpot(courseNo);
		logger.info("admin 나코짜상세보기 여행지 조회결과List={}", list);
		
		Map<String, Object> map=courseService.selectOneJoinMember(courseNo);
		logger.info("admin 나코짜상세보기 조회결과 map={}", map);
		
		
		
		//대표이미지 처리를 위한 공간, MAP에서 KEY로 직접 fileName을 가져옴
		ArrayList<String> listImg=new ArrayList<>();
		String fileName=map.get("THUMB_IMG").toString();
		if(fileName!=null && !fileName.isEmpty()) {
			String[] spFileName=fileName.split(", ");
			for(int i=0;i<spFileName.length;i++) {
				listImg.add(spFileName[i]);
			}
		}
		logger.info("이미지 파일 갯수 확인 listImg.size={}", listImg.size());
		
		model.addAttribute("list", list);
		model.addAttribute("listImg", listImg);
		model.addAttribute("map", map);
		return "admin/nacojja/nacojjamanager/nacojjaDetail";	
	}	
}
