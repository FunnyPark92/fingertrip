package com.ff.finger.admin.controller;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.ff.finger.course.model.CourseService;

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
		logger.info("월 list 사이즈 list.size={}",listR.size());
		
		ArrayList<Integer> listC=new ArrayList<>();
		for(int i=0;i<listR.size();i++) {
			int payment=0;
			String payS="";
			if(winBidService.selectPayment(i)==null||winBidService.selectPayment(i).equals("")) {
				payment=0;
				listC.add(payment);
			}else {
				payS=winBidService.selectPayment(i);
				payment=Integer.parseInt(payS);
				listC.add( payment);
			}
			logger.info("String payment={}",payment);
		
		}
		
		model.addAttribute("listR", listR);
		model.addAttribute("listC", listC);
		return "admin/nacojja/salesChart/salesChartList";
	}
}
