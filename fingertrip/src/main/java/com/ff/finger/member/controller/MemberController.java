package com.ff.finger.member.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.member.model.MemberDAO;
import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;


	@RequestMapping("/agreement.do")
	public String agreement() {
		logger.info("회원약관 화면 보여주기");
		return "member/agreement";
	}

	@RequestMapping("/register.do")
	public void register() {
		logger.info("회원가입 화면 보여주기");
	}
	
	@RequestMapping("/ajaxUserCheckId.do")
	@ResponseBody
	public boolean ajaxUserCheckId(@RequestParam String id) {
		logger.info("유저 아이디 중복 체크 파라미터 id={}",id);
		
		boolean result = memberService.userCheckId(id);
		logger.info("아이디 중복 확인 결과 result={}",result);
		
		return result;
	}

	@RequestMapping("/insertMember.do")
	public String insertMember(@ModelAttribute MemberVO memberVo, @RequestParam String email3, Model model) throws UnsupportedEncodingException, MessagingException {
		logger.info("회원가입 처리 전 파라미터, memberVo={}", memberVo);
		logger.info("회원가입 처리 전 파라미터, email3={}", email3);

		if (email3 != null && !email3.isEmpty()) {
			memberVo.setEmail2(email3);
		}
		if (memberVo.getEmail1() == null || memberVo.getEmail1().isEmpty()) {
			memberVo.setEmail2("");
		}
		if (memberVo.getHp2() == null || memberVo.getHp2().isEmpty() || 
			memberVo.getHp3() == null || memberVo.getHp3().isEmpty()) {
			memberVo.setHp1("");
			memberVo.setHp2("");
			memberVo.setHp3("");
		}
		
		if (memberVo.getMailAgreement() == null || memberVo.getMailAgreement().isEmpty()) {
			memberVo.setMailAgreement("N");
		} else {
			memberVo.setMailAgreement("Y");
		}
		logger.info("회원가입 세팅 후 파라미터, memberVo={}", memberVo);

		int cnt = memberService.insertMember(memberVo);
		logger.info("회원가입 처리 결과, cnt={}", cnt);
		
		String msg = "", url = "";
		if (cnt > 0) {
			String email = memberVo.getEmail1()+"@"+memberVo.getEmail2();
			/*msg="이메일 발송 완료, 이메일 인증 후 로그인 하세요!!";*/
			url = "/member/emailAuth.do?id="+memberVo.getId()+"&email="+email;
			
		} else {
			msg = "회원가입 실패";
			url = "/member/register.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	

	@RequestMapping("/memberOut.do")
	public String memberOut(Model model) {
		logger.info("회원탈퇴 화면 보여주기");
		
		model.addAttribute("menu", "회원탈퇴");
		model.addAttribute("url", "/member/memberOutReason.do");
		
		return "member/memberPwChk";
	}

	@RequestMapping("/memberEdit.do")
	public String memberEdit(Model model) {
		logger.info("회원수정 비밀번호 확인 화면 보여주기");
      
		model.addAttribute("menu", "회원정보 수정");
		model.addAttribute("url", "/member/checkPwd.do");
		return "member/memberPwChk";
   }
	
	
	@RequestMapping("/checkPwd.do")
	public String checkPwd(@ModelAttribute MemberVO vo, HttpSession session, Model model) {
		String id = (String) session.getAttribute("userid");
		logger.info("비밀번호 체크 파라미터 vo={},id={}",vo,id);
		int result =memberService.processLogin(id, vo.getPassword());
		
		String msg="", url="/member/memberEditOk.do";
		if(result == CommonConstants.PWD_MISMATCH) {
			msg="비밀번호가 일치하지 않습니다.";
			url="/member/memberEdit.do";
		}else {
			logger.info("회원수정 화면 보여주기");
		}
		logger.info("체크여부={}",result);
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
    @RequestMapping("/memberEditOk.do")
	public String memberEditOk_get( HttpSession session, Model model) {
    	String id = (String) session.getAttribute("userid");
    	logger.info("회원정보 화면 보여주기 id={}",id);
    	
    	MemberVO vo =memberService.logingMember(id);
    	
    	model.addAttribute("vo",vo);
    	
    	return "member/memberEditOk";
    	
	}
    
    @RequestMapping("/memberEditOk2.do")
    public String memberEditOk_post(@ModelAttribute MemberVO memberVo, HttpSession session, Model model) {
    	String id = (String) session.getAttribute("userid");
    	memberVo.setId(id);
    	logger.info("회원정보 처리 보여주기 vo={},id={}",memberVo,id);  
    	
    	 int cnt = memberService.memberEdit(memberVo);
		 String msg ="", url="/index.do";
		 if(cnt>0) {
			 msg ="회원 정보 수정이 완료되었습니다.";
		 }else {
			 msg ="회원 정보 수정 실패";
		 }
		 model.addAttribute("msg", msg);
		 model.addAttribute("url",url);
		 
		 return "common/message";
    }
    
	
	
	@RequestMapping("/memberOutReason.do")
	public String memberOutReason(HttpSession session, @ModelAttribute MemberVO memberVo, Model model) {
		String id=(String) session.getAttribute("userid");
		memberVo.setId(id);
		logger.info("회원탈퇴 사유 화면 보여주기, 파라미터 memberVo={}", memberVo);
		
		int result=memberService.processLogin(id, memberVo.getPassword());
		logger.info("비밀번호 일치 여부 result={}",result);
		
		String rst="";
		if(result==CommonConstants.LOGIN_OK) {
			rst= "member/memberOutReason";
		}else if(result==CommonConstants.PWD_MISMATCH) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "/member/memberOut.do");

			rst= "common/message";
		}

		return rst;
	}

	@RequestMapping("/memberOutOk.do")
	public String memberOutOk(@ModelAttribute MemberVO memberVo, HttpSession session, Model model, HttpServletResponse response) {
		String id=(String) session.getAttribute("userid");
		memberVo.setId(id);
		logger.info("회원탈퇴 완료 화면 보여주기, 파라미터 memberVo={}", memberVo);

		int cnt=memberService.memberOut(memberVo);
		logger.info("회원탈퇴 처리 cnt={}", cnt);
		
		String rst="";
		if(cnt>0) {
			session.invalidate();
			
			Cookie ck=new Cookie("ck_userid", id);
			ck.setPath("/");
			ck.setMaxAge(0);
			response.addCookie(ck);
			
			logger.info("회원탈퇴 완료");
			rst="member/memberOutOk";
		}else {
			logger.info("회원탈퇴 실패");
			
			model.addAttribute("msg", "회원탈퇴 실패하였습니다.");
			model.addAttribute("url", "/member/memberOut.do");
			rst="common/message";
		}
		return rst;
	}
}