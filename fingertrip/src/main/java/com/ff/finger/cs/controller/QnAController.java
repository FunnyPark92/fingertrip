package com.ff.finger.cs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cs")
public class QnAController {
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	
	@RequestMapping("/QnA/qna.do")
	public String qna() {
		logger.info("Q&A화면 보기");
		
		return "cs/QnA/qna";
	}
	

	@RequestMapping("/QnA/qnaWrite.do")
	public String qnaWrite() {
		logger.info("Q&A글끄기 화면 보기");	
		return "cs/QnA/qnaWrite";
	}
	@RequestMapping("/QnA/qnaDetail.do")
	public String qnaDetail() {
		logger.info("Q&A 상세보기 화면");
		
		return "cs/QnA/qnaDetail";
	}
}
