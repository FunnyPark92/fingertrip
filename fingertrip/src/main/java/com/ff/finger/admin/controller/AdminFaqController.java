package com.ff.finger.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.ff.finger.cs.faq.model.FaqService;
import com.ff.finger.cs.faq.model.FaqVO;
import com.ff.finger.cs.notice.model.NoticeVO;

@Controller
@RequestMapping("/admin/cs/faq")
public class AdminFaqController {
	private static final Logger logger=LoggerFactory.getLogger(AdminFaqController.class);
	
	@Autowired private FaqService faqservice;
	
	@RequestMapping("/faqList.do")
	public String allFaqCategory(@RequestParam(defaultValue="1") int faqCategoryNo, Model model) {
		logger.info("faq 보여주기, faqCategoryNo={}", faqCategoryNo );
		
		List<Map<String, Object>> list=faqservice.allFaqCategory(faqCategoryNo);
		logger.info("faq 조회 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/cs/faq/faqList";
	}
	
	@RequestMapping(value="/faqWrite.do", method=RequestMethod.GET)
	public String faqWrite() {
		logger.info("faq 글쓰기 화면");
		
		return "admin/cs/faq/faqWrite";
	}
	
	@RequestMapping(value="/faqWrite.do", method=RequestMethod.POST)
	public String faqWrite_post(@ModelAttribute FaqVO faqVo,
			HttpServletRequest request, HttpSession session, Model model ) {
		logger.info("faq 글쓰기 처리, faqVo={},  hidFile={}", faqVo);
		
		String adminId=(String) session.getAttribute("adminid");
		logger.info("세션 조회 adminId={}", adminId);
		
		int adminNo=faqservice.getAdminNo(adminId);
		faqVo.setAdminNo(adminNo);
		logger.info("관리자 번호 조회 결과, noticeVo={}", faqVo);

		
		int cnt=faqservice.faqInsert(faqVo);
		logger.info("글쓰기 처리 후, cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "faq 등록이 완료되었습니다.");
		}else {
			model.addAttribute("msg", "faq 등록이 실패하였습니다.");
		}
		model.addAttribute("url", "/admin/cs/faq/faqList.do");
		
		return "common/message";
	}
	
	@RequestMapping(value="/faqEdit.do", method=RequestMethod.GET)
	public String faqEdit(@RequestParam(defaultValue="0") int faqNo, Model model) {
		logger.info("faq 수정 화면, 파라미터 faqNo={}", faqNo);

		if(faqNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/cs/faq/faqList.do");
			
			return "common/message";
		}
		
		FaqVO vo=faqservice.faqSelectByNo(faqNo);
		
		model.addAttribute("vo", vo);
		return "admin/cs/faq/faqEdit";
	}
	
	@RequestMapping(value="/faqEdit.do", method=RequestMethod.POST)
	public String faqEdit_post(@ModelAttribute FaqVO faqVo, HttpServletRequest request,  HttpSession session, Model model ) {
		logger.info("faq 수정 처리, 파라미터 faqVo={}", faqVo);
		
		int cnt=faqservice.faqUpdate(faqVo);
		logger.info("공지사항 수정 처리 후, cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "faq 수정이 완료되었습니다.");
		}else {
			model.addAttribute("msg", "faq 수정이 실패하였습니다.");
		}
		model.addAttribute("url", "/admin/cs/faq/faqList.do");
		
		return "common/message";
	}
	
	@RequestMapping(value="/faqDetail.do", method=RequestMethod.GET)
	public String faqDetail(@RequestParam(defaultValue="0") int faqNo, Model model) {
		logger.info("faq 자세히보기, 파라미터 faqNo={}", faqNo);

		if(faqNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/cs/faq/faqList.do");
			
			return "common/message";
		}
		
		FaqVO vo=faqservice.faqSelectByNo(faqNo);
		
		model.addAttribute("vo", vo);
		return "admin/cs/faq/faqDetail";
	}
	
	@RequestMapping(value="/faqDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqDelete(@ModelAttribute FaqVO faqVo, HttpServletRequest request, Model model) {
		logger.info("faq 삭제, 파라미터 faqVo={}", faqVo);
		
		String msg="", url="/admin/cs/faq/faqList.do";
		if(faqVo.getFaqNo()==0) {
			msg="잘못된 url입니다.";
		}else {
			int cnt=faqservice.faqDelete(faqVo.getFaqNo());
			logger.info("faq 삭제 cnt={}", cnt);
			
			if(cnt>0) {
				msg="faq 삭제를 성공하였습니다.";
			}else {
				msg="faq 삭제를 실패하였습니다.";
			}
		
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteMulti.do")
	public String deleteMulti(@RequestParam String chk[], HttpServletRequest request,Model model) {
		for(int i=0;i<chk.length;i++) {
			logger.info("faq 다중 삭제, 파라미터 chk={}", chk[i]);
			
		}
		
		Map<String, String[]> map=new HashMap<>();
		map.put("nos", chk);
		
		int cnt=faqservice.deleteMulti(map);
		logger.info("다중 삭제, cnt={}", cnt);
		
		String msg="", url="/admin/cs/faq/faqList.do";
		if(cnt>0) {
			msg="faq 삭제를 성공하였습니다.";
		}else {
			msg="faq 삭제를 실패하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}