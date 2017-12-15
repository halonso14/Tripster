package com.tripster.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.tripster.domain.MemberVO;
import com.tripster.service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private MemberService service;
	
	private void saveDest(HttpServletRequest request) {
		
		String uri = request.getRequestURI();
		
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			logger.info("dest : " + (uri + query));
			request.getSession().setAttribute("dest", uri + query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
							 Object Handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		//로그인 상태가 아닐경우
		if(session.getAttribute("login")==null) {
			logger.info("current user is not logined");
			
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			System.out.println("로그인쿠키"+loginCookie);
			
			//로그인 쿠키가 유지되고있을 경우
			if(loginCookie != null) {
				MemberVO vo = service.checkLoginBefore(loginCookie.getValue());
				
				if(vo != null) {
					session.setAttribute("login", vo);
					return true;
				}
			}
			
			response.sendRedirect("/member/login");
			return false;
		}
		return true;
	}
}
