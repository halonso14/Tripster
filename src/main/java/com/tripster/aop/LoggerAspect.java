package com.tripster.aop;
  
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.tripster.domain.MemberVO;

@Component
@Aspect
public class LoggerAspect {
	
	private static final Logger loger = LoggerFactory.getLogger(LoggerAspect.class);
	
//	@Around("execution(* com.tripster.interceptor.LoginInterceptor.loginLog(..))")
//	public Object Memberlog(ProceedingJoinPoint jp) throws Throwable {
//		
//		loger.info("=====================================================");
//		long startTime = System.currentTimeMillis();
//		loger.info("로그인");
//		loger.info("받는 파라미터:"+Arrays.toString(jp.getArgs()));
//		loger.info("실행하는 대상 객체의 메소드에대한 정보 : "+ jp.getSignature());
//		loger.info("target 객체 : " + jp.getTarget());
//		
//		Object result = jp.proceed();
//		
//		long endTime = System.currentTimeMillis();
//		loger.info(jp.getSignature().getName() + "의 걸린시간 : " + (endTime - startTime));
//		loger.info("=====================================================");
//		
//		return result;
//		
//	}
	
	@Before("execution(* com.tripster.service.EsSearchService.getTotalSearchNum(..))")
	public void searchlog(JoinPoint jp) throws Throwable {
		
		loger.info("=====================================================");
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		// 세션 받아오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
		
		// 받아오는 멤버 아이디가 있으면 loger 찍기
		if(memberVO != null) loger.info("login : " + memberVO.toString());
		
		// ip 받아오기
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = req.getRemoteAddr();
        
        loger.info("ip= " + ip);
        loger.info("keyword : "+Arrays.toString(jp.getArgs()));
        
		loger.info("=====================================================");
		
	}
	
	@Around("execution(* com.tripster.controller.HomeController*.*(..))")
	public Object mainlog(ProceedingJoinPoint jp) throws Throwable {
		
		loger.info("=====================================================");
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		// 세션 받아오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
		
		// 받아오는 멤버 아이디가 있으면 loger 찍기
		if(memberVO != null) loger.info("login : " + memberVO.toString());
		
		// ip 받아오기
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = req.getRemoteAddr();
        
        loger.info("ip= " + ip);
        loger.info("keyword : "+Arrays.toString(jp.getArgs()));
        Object result = jp.proceed();
        
		loger.info("=====================================================");
		
		return result;
		
	}
	
}
