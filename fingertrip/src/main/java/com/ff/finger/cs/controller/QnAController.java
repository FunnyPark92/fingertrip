package com.ff.finger.cs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.cs.QnA.model.QnAVO;

@Controller
@RequestMapping("/cs")
public class QnAController {
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@Autowired private QnAService qnAService;
	
	@RequestMapping("/QnA/qna.do")
	public String qna(Model model) {
		
		List<QnAVO> list=qnAService.selectAll();
		logger.info("QnA목록 조회 결과, list.size{}",list.size());
	
		model.addAttribute("list", list);
	
		return "cs/QnA/qna";
	}
	
	@RequestMapping("/QnA/qnaWrite.do")
	public String qnaWrite() {
		logger.info("Q&A글쓰기 화면 보기");	
		return "cs/QnA/qnaWrite";
	}
	
	@RequestMapping("/QnA/qnaDetail.do")
	public String qnaDetail() {
		logger.info("Q&A 상세보기 화면");
		
		return "cs/QnA/qnaDetail";
	}
}
