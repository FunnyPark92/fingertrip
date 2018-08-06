package com.ff.finger.member.controller;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.ff.finger.common.CommonConstants;
import com.ff.finger.email.EmailSender;
import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;

@Controller
@RequestMapping("/member/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class); 
	
	@Autowired
	private MemberService memberService;
	@Autowired private EmailSender emailSender;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login_get() {
		logger.info("로그인 화면 보여주기");
		
		return "member/login/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_post(@ModelAttribute MemberVO memberVo,
							@RequestParam(required=false) String saveId1,
							HttpServletRequest request,
							HttpServletResponse response,
							Model model) {
		logger.info("로그인 처리 전 파라미터, memberVo={}", memberVo);
		logger.info("로그인 처리 전 파라미터, saveId={}", saveId1);
		
		int result = memberService.processLogin(memberVo.getId(), memberVo.getPassword());
		logger.info("로그인 처리 결과, result={}", result);		
		
		String msg = "", url = "/member/login/login.do";
		if (result == CommonConstants.LOGIN_OK) {
			//[1] 세션에 저장
			request.getSession().setAttribute("userid", memberVo.getId());
			//회원정보 읽어오기
			//String userName = memberService.selectUserName(vo.getUserid());
			//request.getSession().setAttribute("userName", userName);
			
			//[2] 아이디 저장에 체크되었으면 쿠키에 저장
			Cookie ck = new Cookie("ck_userid", memberVo.getId());
			ck.setPath("/");
			
			if (saveId1 != null) {
				ck.setMaxAge(30*24*60*60); //쿠키 유효기간 - 30일
				response.addCookie(ck);
			} else {
				ck.setMaxAge(0); //쿠키 삭제
				response.addCookie(ck);
			}
			
			msg = "로그인 되었습니다!";
			//msg = userName + "님 로그인 되었습니다!";
			url = "/index.do";
		} else if (result == CommonConstants.PWD_MISMATCH){
			msg = "비밀번호 불일치!";
		} else if (result == CommonConstants.ID_NONE) {
			msg = "존재하지 않는 아이디임!";
		} else if (result == CommonConstants.EMAIL_AUTHENTICATION){
			msg = "이메일 인증 후 로그인 하셔야 합니다!";
		} else {
			msg = "로그인 처리 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		logger.info("로그아웃처리 ");
		String id = (String)session.getAttribute("userid");
		logger.info("현재 세션 id={}",id);
		memberService.memberLogOut(id);
		
		session.removeAttribute("userid");
		//session.removeAttribute("userName");
		
		return "redirect:/index.do";
	}
	
	@RequestMapping("/findId.do")
	public String findId() {
		logger.info("아이디 찾기 보여주기");
		
		return "member/login/findId";
	}
	
	@RequestMapping("/foundId.do")
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
	
	@RequestMapping("/findPw.do")
	public String findPw() {
		logger.info("비밀번호 찾기 보여주기");
		
		return "member/login/findPw";
	}
	
	@RequestMapping("/foundPw.do")
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
