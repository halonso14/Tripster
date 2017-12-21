package com.tripster.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

//	@Inject
//	private MemberService service;
//
//	private void saveDest(HttpServletRequest request) {
//
//		String uri = request.getRequestURI();
//
//		String query = request.getQueryString();
//
//		if (query == null || query.equals("null")) {
//			query = "";
//		} else {
//			query = "?" + query;
//		}
//
//		if (request.getMethod().equals("GET")) {
//			logger.info("dest : " + (uri + query));
//			request.getSession().setAttribute("dest", uri + query);
//		}
//	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("main page!!");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

//	@RequestMapping(value = "/*", method = RequestMethod.GET)
//	public String cookieCheck(HttpServletRequest request, Model model) {
//		logger.info("로그인 쿠키 체크");
//
//		HttpSession session = request.getSession();
//
//		saveDest(request);
//
//		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//
//		if (loginCookie != null) {
//			MemberVO vo = service.checkLoginBefore(loginCookie.getValue());
//
//			if (vo != null) {
//				session.setAttribute("login", vo);
//			}
//		}
//		
//		Object dest = session.getAttribute("dest");
//		if(dest != null) {
//			return (String)dest;
//		} else {
//			return "/";
//		}
//	}
}
