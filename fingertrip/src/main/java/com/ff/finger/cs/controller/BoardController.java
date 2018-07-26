package com.ff.finger.cs.controller;

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
import com.ff.finger.cs.board.model.BoardService;
import com.ff.finger.cs.board.model.BoardVO;

@Controller
@RequestMapping("/cs")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired private BoardService boardService;
	
	@RequestMapping("/notice/board.do")
	public String board(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("공지사항 목록 파라미터, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		List<BoardVO> list=boardService.selectAllBoard(searchVo);
		logger.info("공지사항 목록 조회 결과, list.size={}",list.size());
	
		int totalRecord=boardService.totalRecord(searchVo);
		logger.info("공지사항 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	
		return "cs/notice/board";
	}
	
	@RequestMapping("/notice/countUpdate.do")
	public String countUpdate(@RequestParam int boardNo, Model model) {
		logger.info("board 조회수 증가, 파라미터 qnaNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/cs/notice/board.do");
			
			return "common/message";
		}
		int cnt=boardService.countUpdateboard(boardNo);
		logger.info("조회수 증가 후 cnt={}", cnt);
		
		return "redirect:/cs/notice/boardDetail.do?boardNo="+boardNo;
	}
	
	
	@RequestMapping("/notice/boardDetail.do")
	public String boardDetail(@RequestParam(defaultValue="0") int boardNo) {
		logger.info("공지사항 상세보기 화면");
		return "cs/notice/boardDetail";
	}
}
