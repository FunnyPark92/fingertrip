package com.ff.finger.footer.controller;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.email.EmailSender;

@Controller
@RequestMapping("/footer")
public class AdvertiseController {
	private static final Logger logger = LoggerFactory.getLogger(AdvertiseController.class); 
	
	@Autowired private EmailSender emailSender;
	
	@RequestMapping("/advertise.do")
	public String advertise() {   
		logger.info("제휴 광고 문의 보여주기");
		
		return "footer/advertise";
	}
	
	@RequestMapping("/advertise/send.do")
	public String send(@RequestParam String name, @RequestParam String email,
			@RequestParam String title, @RequestParam String message, Model model){
		logger.info("이메일보내기 email={}", email, title);
		
		String subject=title;
		String content="담당자 : "+name+"\r\n"+"이메일 : "+email+"\r\n"+message;
		String to="fingertrip2018@gmail.com";
		String from=email;

		String msg="", url="/footer/advertise.do";
		
		try {
			emailSender.sendEmail(subject, content, to, from);
			logger.info("이메일 발송 성공");
			msg="임시 비밀번호를 이메일로 발송하였습니다.";
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패");
			e.printStackTrace();
			msg="임시 비밀번호 발송에 실패하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
			
		return "common/message";
			
	}
	
}
