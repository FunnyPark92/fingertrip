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
	@Autowired
	private MailHandler sendMail;
	

	@RequestMapping("/member/emailAuth.do") 
	public String emailAuth(@RequestParam String id, String email,Model model) throws MessagingException, UnsupportedEncodingException {
		logger.info("이메일 전송 컨트롤러 id={} ,email={}",id,email);	// 사용자 아이디와 이메일주소를 받음 
		
		// 보낼 이메일 내용
		String subject = "[이메일 인증]";
		String htmlContent = new StringBuffer().append("<h1>FingerTrip Email본인인증</h1>") 
				.append("아래 버튼 클릭시 회원 가입이 완료됩니다.")
				//form으로 만들어 사용자가 버튼 클릭시 특정 url로 id값을 보내도록 구현
				.append("<form action='http://localhost:9090/finger/member/emailComplete.do' method='post'>") 
				.append("<input type='submit' value='본인 인증 확인'>")  //  
				.append("<input type='hidden' name='id' value='"+id+"'>") 
				.append("</form>")
				.toString();
		String email2 ="admin@fingerTrip.com"; // 보내는 사람 이메일 주소
		String name = "FingerTrip"; // 보내는 사람 이름
		String emailTo = email; // 받는 사람 이메일 주소 
		//
		sendMail.sendMail(subject, htmlContent, email2, name, emailTo);
		String msg="이메일 발송 완료, 인증 후 로그인하세요 !!", url="/index.do";
		model.addAttribute("msg",msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/member/emailComplete.do") //보내진 이메일에서 인증 버튼을 클릭
	public String emailAuthCom(@RequestParam String id,Model model) {
		logger.info("이메일에서 받아온 파라미터 vo={}",id); //이메일 사용자의 아이디 값 받아오기 
		
		String msg="" , url="/member/login/login.do"; 
		int cnt = memberService.emailAuth(id); // 받아온 아이디 값으로 DB에 인증 컬럼을 'Y' 로 변경 
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










