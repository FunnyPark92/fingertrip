package com.ff.finger.cs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		logger.info("QnA목록 조회 결과, list.size={}",list.size());
	
		model.addAttribute("list", list);
	
		return "cs/QnA/qna";
	}
	
	@RequestMapping("/QnA/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue="0") int qnaNo, Model model) {
		logger.info("Q&A 조회수 증가, 파라미터 qnaNo={}", qnaNo);
		
		if(qnaNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/cs/QnA/qna.do");
			
			return "common/message";
		}
		int cnt=qnAService.countUpdate(qnaNo);
		logger.info("조회수 증가 후 cnt={}", cnt);
		
		return "redirect:/cs/QnA/qnaDetail.do?qnaNo="+qnaNo;
	}
	
	@RequestMapping("/QnA/qnaDetail.do")
	public String qnaDetail(@RequestParam(defaultValue="0") int qnaNo, HttpServletRequest request, Model model) {
		logger.info("QnA 상세보기 파라미터 qnaNo={}", qnaNo);
		
		if(qnaNo==0) {
			model.addAttribute("msg","잘못됫 url입니다.");
			model.addAttribute("url","/cs/QnA/qna.do");
			return "common/message"; 
		}
		
		QnAVO vo=qnAService.selectByNo(qnaNo);
		logger.info("QnA 상세보기 결과, vo={}", vo);
		
		model.addAttribute("vo",vo);
		
		return "cs/QnA/qnaDetail";
	}
	
	@RequestMapping("/QnA/qnaWrite.do")
	public String qnaWrite() {
		logger.info("Q&A글쓰기 화면 보기");	
		return "cs/QnA/qnaWrite";
	}
	
	
}
