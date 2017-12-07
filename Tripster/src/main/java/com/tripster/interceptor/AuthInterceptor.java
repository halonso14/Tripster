package com.tripster.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
							 Object Handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login")==null) {
			logger.info("current user is not logined");
			
			response.sendRedirect("/member/login");
			return false;
		}
		return true;
	}
}
