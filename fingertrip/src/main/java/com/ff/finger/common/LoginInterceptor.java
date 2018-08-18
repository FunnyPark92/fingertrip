package com.ff.finger.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter  {
	public static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("LoginInterceptor!");
		
		String userid = (String) request.getSession().getAttribute("userid");
		String agencyid = (String) request.getSession().getAttribute("agencyid");
		logger.info("세션에 저장된 아이디 읽어오기, userid={}, agencyid={}", userid, agencyid);
		
		if (agencyid != null && !agencyid.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script type='text/javascript'>");
			out.print("alert('일반회원만 이용 가능합니다.');");
			out.println("location.href='"+request.getContextPath()+"/index.do'");
			out.println("</script>");
			
			return false;
		}
		
		if (userid==null || userid.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script type='text/javascript'>");
			out.print("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("location.href='"+request.getContextPath()+"/member/login/login.do'");
			out.println("</script>");
			
			return false;
		}
		
		return true;
	}
}






























