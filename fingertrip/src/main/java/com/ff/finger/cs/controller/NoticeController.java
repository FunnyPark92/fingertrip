package com.ff.finger.cs.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.cs.notice.model.NoticeService;
import com.ff.finger.cs.notice.model.NoticeVO;

@Controller
@RequestMapping("/cs/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired private NoticeService noticeService;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("공지사항 목록 파라미터, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<NoticeVO> list=noticeService.selectAllNotice(searchVo);
		logger.info("공지사항 목록 조회 결과, list.size={}",list.size());
	
		int totalRecord=noticeService.totalRecord(searchVo);
		logger.info("공지사항 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	
		return "cs/notice/noticeList";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public String noticeWrite() {
		logger.info("공지사항 글쓰기 화면");
		
		return "cs/notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo, HttpSession session, Model model ) {
		logger.info("공지사항 글쓰기 처리, noticeVo={}", noticeVo);
		
		/*String adminId=(String) session.getAttribute("adminId");
		logger.info("세션 조회 adminId={}", adminId);*/
		
		int adminNo=noticeService.getAdminNo("admin3");
		noticeVo.setAdminNo(adminNo);
		logger.info("관리자 번호 조회 결과, noticeVo={}", noticeVo);
		
		int cnt=noticeService.noticeInsert(noticeVo);
		logger.info("글쓰기 처리 후, cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "공지사항 등록이 완료되었습니다.");
		}else {
			model.addAttribute("msg", "공지사항 등록이 실패하였습니다.");
		}
		model.addAttribute("url", "/cs/notice/noticeList.do");
		
		return "common/message";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam int noticeNo, Model model) {
		logger.info("공지사항 조회수 증가, 파라미터 noticeNo={}", noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/cs/notice/noticeList.do");
			
			return "common/message";
		}
		
		int cnt=noticeService.countUpdateNotice(noticeNo);
		logger.info("조회수 증가 후 cnt={}", cnt);
		
		return "redirect:/cs/notice/noticeDetail.do?noticeNo="+noticeNo;
	}
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam(defaultValue="0") int noticeNo, Model model) {
		logger.info("공지사항 상세보기 화면, 파라미터 noticeNo={}", noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url 입니다.");
			model.addAttribute("url", "/cs/notice/noticeList.do");
			
			return "common/message";
		}
		NoticeVO vo=noticeService.noticeDetail(noticeNo);
		logger.info("공지사항 상세보기 조회 결과, vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "cs/notice/noticeDetail";
	}
}
