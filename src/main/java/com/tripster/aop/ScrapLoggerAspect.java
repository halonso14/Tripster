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
public class ScrapLoggerAspect {

	@Inject
	LoggerService service;
	
	private static final Logger loger = LoggerFactory.getLogger(MemberLoggerAspect.class);
	
	// 컨텐츠 스크랩
	@Around("execution(* com.tripster.controller.ScrapModuleController.scrap(..))")
	public Object scrap(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "contents scrap");
		
		return result;
		
	}
	
	// 컨텐츠 스크랩 제거
	@Around("execution(* com.tripster.controller.ScrapModuleController.scrapDelete(..))")
	public Object scrapDelete(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "contents scrapDelete");
		
		return result;
		
	}
	
	// 컨텐츠 스크랩 리스트 조회
	@Around("execution(* com.tripster.controller.ScrapModuleController.scrapList(..))")
	public Object scrapList(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "contents scrapList");
		
		return result;
		
	}
	
	// 컨텐츠 스크랩 리스트에서 스크랩 삭제
	@Around("execution(* com.tripster.controller.ScrapModuleController.scrapIDRemove(..))")
	public Object scrapIDRemove(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "contents scrapIDRemove");
		
		return result;
		
	}
	
}
