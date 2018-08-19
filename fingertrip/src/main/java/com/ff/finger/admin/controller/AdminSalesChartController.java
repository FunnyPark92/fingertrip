package com.ff.finger.admin.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.PaginationInfo;
import com.ff.finger.common.SearchVO;
import com.ff.finger.course.model.CourseService;
import com.ff.finger.course.model.CourseVO;
import com.ff.finger.member.model.OutReasonVO;
import com.ff.finger.winBid.model.WinBidService;

@Controller
@RequestMapping("/admin")
public class AdminSalesChartController {
	private static final Logger logger=LoggerFactory.getLogger(AdminSalesChartController.class);
	
	@Autowired 
	CourseService courseService;
	
	@Autowired
	WinBidService winBidService;
	
	@RequestMapping("/salesChart.do")
	public String salesChart(Model model) {
		
		List<String> listR=new ArrayList();
		for(int i=1; i<13; i++) {
		listR.add(i+"월");
		}
		
		int payment=0;
		ArrayList<Integer> listC=new ArrayList<>();
		for(int i=0;i<listR.size();i++) {
			payment=winBidService.selectPayment(i);
			listC.add(payment);
		}
		model.addAttribute("listR", listR);
		model.addAttribute("listC", listC);
		return "admin/nacojja/salesChart/salesChartList";
	}
}
