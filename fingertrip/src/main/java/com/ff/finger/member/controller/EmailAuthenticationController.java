package com.ff.finger.member.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.email.MailHandler;
import com.ff.finger.member.model.MemberService;

@Controller
public class EmailAuthenticationController {
	
	private static final Logger logger =  LoggerFactory.getLogger(EmailAuthenticationController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	

	@RequestMapping("/member/emailAuth.do") 
	public String emailAuth(@RequestParam String id, String email) throws MessagingException, UnsupportedEncodingException {
		logger.info("이메일 전송 컨트롤러 id={} ,email={}",id,email);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>FingerTrip Email본인인증</h1>")
				.append("아래 버튼 클릭시 회원 가입이 완료됩니다.")
				.append("<form action='http://localhost:9090/finger/member/emailComplete.do' method='post'>")
				.append("<input type='submit' value='본인 인증 확인'>")
				.append("<input type='hidden' name='id' value='"+id+"'>")
				.append("</form>")
				.toString());
		sendMail.setFrom("admin@fingerTrip.com", "FingerTrip");
		sendMail.setTo(email);
		sendMail.send();
		
		
		
		return "index";
		
	}
	
	@RequestMapping("/member/emailComplete.do")
	public String emailAuthCom(@RequestParam String id,Model model) {
		logger.info("이메일에서 받아온 파라미터 vo={}",id);
		
		String msg="" , url="/member/login/login.do";
		int cnt = memberService.emailAuth(id);
		if(cnt>0) {
			logger.info("id 는 이메일 인증 완료 id={} , cnt={}",id,cnt);
			msg=id+"님 인증 성공";
		}else {
			logger.info("id 는 이메일 인증 실패 id={} , cnt={}",id,cnt);
			msg="본인 인증 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	
	}
	
}










