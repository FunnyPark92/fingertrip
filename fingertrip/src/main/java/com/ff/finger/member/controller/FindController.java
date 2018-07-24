package com.ff.finger.member.controller;

import java.util.UUID;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ff.finger.email.EmailSender;
import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;

@Controller
public class FindController {
	private static final Logger logger=LoggerFactory.getLogger(FindController.class);
	@Autowired private MemberService memberService;
	@Autowired private EmailSender emailSender;
	
	@RequestMapping("/member/login/findId.do")
	public String findId() {
		logger.info("아이디 찾기 보여주기");
		
		return "member/login/findId";
	}
	
	@RequestMapping("/member/login/foundId.do")
	public String foundId(@ModelAttribute MemberVO memberVo, @RequestParam String email, Model model) {
		logger.info("아이디 찾기 처리, 파라미터 memberVo={}, email={}", memberVo, email);
		
		String email1=email.substring(0, email.indexOf("@"));
		String email2=email.substring(email.indexOf("@")+1);

		memberVo.setEmail1(email1);
		memberVo.setEmail2(email2);
		logger.info("아이디 찾기, 이메일 처리 후 memberVo={}",memberVo);
		
		String id=memberService.findId(memberVo);
		logger.info("아이디 찾기 처리 후, id={}",id);
		
		if(id==null||id.isEmpty()) {
			model.addAttribute("msg", "존재하지 않는 이름과 이메일입니다.");
			model.addAttribute("url", "/member/login/findId.do");
			
			return "common/message";
		}else {
			memberVo.setId(id);
			logger.info("아이디 찾기 처리 후, memberVo={}", memberVo);
			
			model.addAttribute("vo", memberVo);
			
			return "member/login/foundId";
			
		}
	}
	
	@RequestMapping("/member/login/findPw.do")
	public String findPw() {
		logger.info("비밀번호 찾기 보여주기");
		
		return "member/login/findPw";
	}
	
	@RequestMapping("/member/login/foundPw.do")
	public String foundPw(@ModelAttribute MemberVO memberVo, @RequestParam String email, Model model) {
		logger.info("비밀번호 찾기 처리, 파라미터 memberVo={}, email={}", memberVo, email);
		
		String email1=email.substring(0, email.indexOf("@"));
		String email2=email.substring(email.indexOf("@")+1);

		memberVo.setEmail1(email1);
		memberVo.setEmail2(email2);
		logger.info("비밀번호 찾기, 이메일 처리 후 memberVo={}",memberVo);
		
		int rst=memberService.findPwCnt(memberVo);
		logger.info("비밀번호 찾기, 아이디, 이메일 조회 후 rst={}", rst);
		
		String msg="", url="/member/login/login.do";
		if(rst==0) {
			msg="존재하지 않는 아이디와 이메일입니다.";
			url="/member/login/findPw.do";
		}else {
			String uuid=UUID.randomUUID().toString().replace("-","");
			uuid=uuid.substring(0, 10);
			memberVo.setPassword(uuid);
			logger.info("uuid 변경 후 memberVo={}", memberVo);
			
			int cnt=memberService.updatePw(memberVo);
			logger.info("비밀번호 찾기, 비밀번호 변경 후 cnt={}", cnt);
			
			if(cnt==0) {
				msg="임시 비밀번호 변경에 실패하였습니다.";
				url="/member/login/findPw.do";
			}else {
				String subject="[FingerTrip] 임시비밀번호 발송메일입니다.";
				String content=memberVo.getId()+"님 안녕하세요.\r\n \r\n 임시비밀번호는 "+memberVo.getPassword()+" 입니다.\r\n\r\n 로그인 후 비밀번호를 변경해주세요.";
				String to=email;
				String from="admin@fingerTrip.com";
				
				try {
					emailSender.sendEmail(subject, content, to, from);
					logger.info("이메일 발송 성공");
					msg="임시 비밀번호를 이메일로 발송하였습니다.";
				} catch (MessagingException e) {
					logger.info("이메일 발송 실패");
					e.printStackTrace();
					msg="임시 비밀번호 발송에 실패하였습니다.";
				}
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
