package com.tripster.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.view.RedirectView;

import com.tripster.domain.MemberVO;
import com.tripster.service.MemberService;

@Controller
@RequestMapping("/connect")
public class FacebookLoginController extends ConnectController {

	private static final Logger logger = LoggerFactory.getLogger(FacebookLoginController.class);
	private String TARGET_URL = new String();
	
	@Inject
	private MemberService service;
	
	@Resource(name = "inMemoryConnectionRepository")
	private ConnectionRepository connectionRepository;
	
	@Inject public FacebookLoginController(ConnectionFactoryLocator connectionFactoryLocator, 
											ConnectionRepository connectionRepository) {
		super(connectionFactoryLocator, connectionRepository);
	}
	
	@RequestMapping(value="/{providerId}", method=RequestMethod.POST)
	public RedirectView connect(@PathVariable String providerId, NativeWebRequest request) {
		
		HttpServletRequest httpServletRequest = (HttpServletRequest)request.getNativeRequest();
		HttpSession session = httpServletRequest.getSession();
		
		TARGET_URL = (String)session.getAttribute("dest");
		
		return super.connect(providerId, request);
	}
	
	@RequestMapping(value="/{providerId}", method = RequestMethod.GET, params="code")
	public RedirectView oauth2Callback(@PathVariable String providerId, NativeWebRequest request) {
		
		RedirectView redirectView = super.oauth2Callback(providerId, request);
		
		//사용자 ID가져오기
		Connection<Facebook> connection = connectionRepository.findPrimaryConnection(Facebook.class);
		
		Facebook facebook = connection.getApi();
		
		String[] fields = {"id", "age_range", "email", "first_name", "gender", "last_name", "link",
							"locale", "name", "third_party_id", "birthday", "verified"};
		
		User memberProfile = facebook.fetchObject("me", User.class, fields);
		System.out.println(memberProfile);
		
		MemberVO vo = null;
		
		//로그인 처리
		try {
			vo = service.oAuthenticationBinding(new MemberVO(), memberProfile);
			
			request.setAttribute("login", vo, 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		redirectView.setUrl(TARGET_URL != null ? TARGET_URL : "/");
		
		return redirectView;
	}
	
}
