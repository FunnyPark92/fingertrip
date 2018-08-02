package com.ff.finger.email;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailHandler {
	
	@Autowired
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	/*public void mailHandler(String subject,String content,String email,String name) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
		messageHelper.setSubject(subject);
		messageHelper.setText(content, true);
		messageHelper.setTo(email);
		messageHelper.setFrom(email,name);
		mailSender.send(message);
	}*/
	
	
	public MailHandler(JavaMailSender mailSender) throws MessagingException{
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message,true,"UTF-8");
	}
	
	public void setSubject(String subject) throws MessagingException {
        messageHelper.setSubject(subject);
    }
    public void setText(String htmlContent) throws MessagingException {
        messageHelper.setText(htmlContent, true);
    }
    public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
    	messageHelper.setFrom(email, name);
    }
    public void setTo(String email) throws MessagingException {
        messageHelper.setTo(email);
    }
    public void addInline(String contentId, DataSource dataSource) throws MessagingException {
        messageHelper.addInline(contentId, dataSource);
    }
    public void send() {
        mailSender.send(message);
    }
	
	
}
	