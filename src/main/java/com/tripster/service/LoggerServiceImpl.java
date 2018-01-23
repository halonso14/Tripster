package com.tripster.service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.tripster.aop.MemberLoggerAspect;
import com.tripster.domain.MemberVO;

@Service
public class LoggerServiceImpl implements LoggerService{
	
	private static final Logger loger = LoggerFactory.getLogger(MemberLoggerAspect.class);
	
	@Override
	public void Logger(ProceedingJoinPoint jp,String page) throws Exception{
		loger.info("=====================================================");
		loger.info(page);
		
		// 현재 시간 구하기
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String now = dayTime.format(new Date(time));
		loger.info("현재 시간 : "+now);
		
		// 세션 받아서 회원 정보 받기
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();	
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
		// 받아오는 멤버 아이디가 있으면 loger 찍기
		if(memberVO != null) loger.info("login : " + memberVO.toString());
		
		// ip 받아오기
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = req.getRemoteAddr();
        loger.info("ip= " + ip);
        
        // 파라미터 값 받아오기
        loger.info("parameter : "+Arrays.toString(jp.getArgs()));
        
        loger.info("=====================================================");
        
	}

}
