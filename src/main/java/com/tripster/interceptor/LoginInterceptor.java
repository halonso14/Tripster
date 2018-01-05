package com.tripster.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
						   Object handler, ModelAndView modelAndView) throws Exception{
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object memberVO = modelMap.get("memberVO");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		//로그인 정보가 맞을시
		if(memberVO != null) {
			System.out.println(memberVO);
			logger.info("로그인됐다고");
			session.setAttribute(LOGIN, memberVO);
			
			if(memberVO != null) {
				logger.info("remember me..");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				//쿠키 수명 : 하루동안 브라우저에 보관
				loginCookie.setMaxAge(60*60*24);
				response.addCookie(loginCookie);
			}
			
			Object dest = session.getAttribute("dest");
			
			response.sendRedirect(dest != null ? (String)dest : "/");
		
			//로그인 정보가 틀릴시
		} else {
			logger.info("로그인정보 불일치");
			out.print("<script>"
					+ "alert('로그인 정보를 확인하세요');"
					+ "history.go(-1);"
					+ "</script>");
			out.flush();
			out.close();
		}
		
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
							 Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
}
