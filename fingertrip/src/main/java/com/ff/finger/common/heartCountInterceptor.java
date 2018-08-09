package com.ff.finger.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ff.finger.member.model.MemberService;
import com.ff.finger.member.model.MemberVO;

@Component
public class heartCountInterceptor extends HandlerInterceptorAdapter  {
	public static final Logger logger = LoggerFactory.getLogger(heartCountInterceptor.class);
	
	@Autowired
	private MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("heartCountInterceptor!");
		
		String userid = (String) request.getSession().getAttribute("userid");
		MemberVO memberVo = memberService.logingMember(userid);
		logger.info("로그인 한 회원의 현재 하트 갯수, HeartCount={}", memberVo.getHeartCount());
		
		if (memberVo.getHeartCount() < 1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.print("alert('횐님! 하트가 부족하시네요. 충전부터 하시죵~');");
			out.println("location.href='"+request.getContextPath()+"/myPage/myHeart/heartList.do'");
			out.println("</script>");
			
			return false;
		}
		
		return true;
	}
}






























