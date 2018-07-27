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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.cs.QnA.model.QnAService;
import com.ff.finger.cs.QnA.model.QnAVO;

@Controller
@RequestMapping("/cs")
public class QnAController {
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@Autowired private QnAService qnAService;
	
	@RequestMapping("/QnA/qna.do")
	public String qna(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("QnA 목록 파라미터, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(CommonConstants.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(CommonConstants.RECORD_COUNT_PER_PAGE);
	
		List<QnAVO> list=qnAService.selectAll(searchVo);
		logger.info("QnA목록 조회 결과, list.size={}",list.size());
		
		int QnAtotalRecord=qnAService.QnAtotalRecord(searchVo);
		logger.info("QnA totalRecord={}", QnAtotalRecord);
		pagingInfo.setTotalRecord(QnAtotalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	
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
	
	@RequestMapping(value="/QnA/passck.do", method=RequestMethod.POST)
	public String passck(@RequestParam(defaultValue="0") String pwd, @RequestParam int qnaNo, HttpServletRequest request, Model model) {
		logger.info("QnA 상세보기 비밀번호 확인 파라미터 pwd={}", pwd);
		logger.info("QnA 상세보기 비밀번호 확인 파라미터 qnaNo={}", qnaNo);
	
		String dbpwd=qnAService.passck(qnaNo);
		logger.info("QnA 상세보기 비밀번호 확인 파라미터 dbpwd={}",dbpwd);
		
		if(pwd.equals(dbpwd)) {
			return "redirect:/cs/QnA/countUpdate.do?qnaNo="+qnaNo;
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다..");
			model.addAttribute("url","/cs/QnA/qna.do");
			return "common/message"; 
		}
	}
}
