package com.ff.finger.cs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cs")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@RequestMapping("/notice/board.do")
	public String board() {
		logger.info("공지사항 보기");
		return "cs/notice/board";
	}
	
	@RequestMapping("/notice/boardDetail.do")
	public String boardDetail() {
		logger.info("공지사항 상세보기 화면");
		return "cs/notice/boardDetail";
	}
}
