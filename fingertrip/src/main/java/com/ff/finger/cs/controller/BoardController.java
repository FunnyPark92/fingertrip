package com.ff.finger.cs.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ff.finger.cs.board.model.BoardService;

@Controller
@RequestMapping("/cs")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired private BoardService boardService;
	
	@RequestMapping("/notice/board.do")
	public String board(Model model) {
		
		List<Map<String, Object>> list=boardService.selectAllBoard();
		logger.info("Board목록 조회 결과, list.size{}",list.size());
	
		model.addAttribute("boardlist", list);
	
		return "cs/notice/board";
	}
	
	@RequestMapping("/notice/boardDetail.do")
	public String boardDetail() {
		logger.info("공지사항 상세보기 화면");
		return "cs/notice/boardDetail";
	}
}
