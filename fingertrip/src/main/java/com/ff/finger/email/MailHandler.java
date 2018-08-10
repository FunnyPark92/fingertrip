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

	public void sendMail(String subject, String htmlContent, String email, String name,String emailTo) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		
		message.setSubject(subject);
		message.setText(htmlContent,"UTF-8","HTML");
		message.setRecipient(RecipientType.TO, new InternetAddress(emailTo));
		message.setFrom(new InternetAddress(email));
		mailSender.send(message);
	}
	
	
}
	
