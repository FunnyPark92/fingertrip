package com.ff.finger.admin.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ff.finger.admin.model.AdminService;
import com.ff.finger.common.CommonConstants;
import com.ff.finger.cs.faq.model.FaqService;
import com.ff.finger.cs.faq.model.FaqVO;
import com.ff.finger.cs.notice.model.NoticeVO;

@Controller
@RequestMapping("/admin/cs/faq")
public class AdminFaqController {
	private static final Logger logger=LoggerFactory.getLogger(AdminFaqController.class);
	
	@Autowired private FaqService faqservice;
	@Autowired private AdminService adminService;
	
	@RequestMapping("/faqList.do")
	public String allFaqCategory(@RequestParam(defaultValue="1") int faqCategoryNo, Model model) {
		logger.info("faq 보여주기, faqCategoryNo={}", faqCategoryNo );
		
		List<Map<String, Object>> list=faqservice.allFaqCategory(faqCategoryNo);
		logger.info("faq 조회 결과 list.size={}", list.size());
		
	/*	StringBuffer s = new StringBuffer();
        for(int i=0;i<list.size();i++) {
        	
        	BufferedReader br = new BufferedReader(list.get(i).get("CONTENT").getCharacterStream());
            String ts = "";
            while((ts = br.readLine()) != null) {
                   s.append(ts + "\n");
            }
            br.close();
            String ss= s.toString();
            
        	
        }*/
		
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
	
	
	
}
