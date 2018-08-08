package com.ff.finger.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ff.finger.admin.model.AdminService;
import com.ff.finger.admin.model.AdminVO;
import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.FileUploadUtil;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.cs.faq.model.FaqService;
import com.ff.finger.cs.faq.model.FaqVO;
import com.ff.finger.cs.notice.model.NoticeService;
import com.ff.finger.cs.notice.model.NoticeVO;

@Controller
@RequestMapping("/admin/cs/faq")
public class AdminFaqController {
	private static final Logger logger=LoggerFactory.getLogger(AdminFaqController.class);
	
	@Autowired private FaqService faqservice;
	
	@RequestMapping("/faqList.do")
	public String selectFaqCategory(@RequestParam(defaultValue="1") int faqCategoryNo, Model model) {
		logger.info("faq 보여주기, 파라미터 faqCategoryNo={}", faqCategoryNo );
		
		List<FaqVO> list=faqservice.selectFaqCategory(faqCategoryNo);
		logger.info("faq 조회 결과 list.size={}", list.size());
		
		
		model.addAttribute("list", list);
		
		return "admin/cs/faq/faqList";
	}
	
}
