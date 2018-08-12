package com.ff.finger.email;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailHandler {
	
	@Autowired
	private JavaMailSender mailSender;

	//html형식 메일 보내기 메서드 
	public void sendMail(String subject, String htmlContent, String email, String name,String emailTo) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		
		message.setSubject(subject); // 타이틀
		message.setText(htmlContent,"UTF-8","HTML"); //이메일 내용, 형식을 HTML로 설정
		message.setRecipient(RecipientType.TO, new InternetAddress(emailTo)); // 받는 사람  이메일 주소
		message.setFrom(new InternetAddress(email)); // 보내는 사람 이메일
		mailSender.send(message);
	}
	
	
}
	
