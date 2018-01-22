package com.tripster.aop;

import javax.inject.Inject;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.tripster.service.LoggerService;


@Component
@Aspect
public class MemberLoggerAspect {
	
	@Inject
	LoggerService service;
	
	private static final Logger loger = LoggerFactory.getLogger(MemberLoggerAspect.class);
	
	// 메인 페이지
	@Around("execution(* com.tripster.controller.HomeController*.*(..))")
	public Object mainlog(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "Main Page");
		
		return result;
		
	}
	
	// 로그인 페이지
	@Around("execution(* com.tripster.controller.MemberController.loginGET(..))")
	public Object loginGET(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"Loing page");
		
		return result;
	}
	
	// 로그인 시도
	@Around("execution(* com.tripster.controller.MemberController.loginPOST(..))")
	public Object loginPOST(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"Login Try");
		
		return result;
	}
	
	// 회원가입 페이지
	@Around("execution(* com.tripster.controller.MemberController.registerGET(..))")
	public Object registerGET(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"Member Register Page");
		
		return result;
	}	

	// 회원가입 시도
	@Around("execution(* com.tripster.controller.MemberController.registerPost(..))")
	public Object registerPost(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"Member Register Try");
		
		return result;
	}
	
	// 로그아웃
	@Around("execution(* com.tripster.controller.MemberController.logout(..))")
	public Object logout(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"Member logout");
		
		return result;
	}
	
	// 마이 페이지
	@Around("execution(* com.tripster.controller.MemberController.mypage(..))")
	public Object mypage(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"Member MyPage");
		
		return result;
	}
	
	// 기본 정보 변경
	@Around("execution(* com.tripster.controller.MemberController.changeProfile(..))")
	public Object changeProfile(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"Member Profile Change");
		
		return result;
	}
	
	// 회원탈퇴
	@Around("execution(* com.tripster.controller.MemberController.remove(..))")
	public Object remove(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"Member leave ");
		
		return result;
	}
	
	// 회원 플랜 리스트 조회
	@Around("execution(* com.tripster.controller.MemberController.viewMember(..))")
	public Object viewMember(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp,"member plan list ");
		
		return result;
	}
	
}
