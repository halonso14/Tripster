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
public class SearchLoggerAspect {
	
	@Inject
	LoggerService service;
	
	private static final Logger loger = LoggerFactory.getLogger(MemberLoggerAspect.class);
	
	// 검색 페이지
	@Around("execution(* com.tripster.controller.SearchController.search(..))")
	public Object search(ProceedingJoinPoint jp) throws Throwable {
		
		if(jp.getArgs()[1].toString().equals("contents")) {
			service.Logger(jp, "searchPage contents");
		}else if(jp.getArgs()[1].toString().equals("member")) {
			service.Logger(jp, "searchPage member");
		}else if(jp.getArgs()[1].toString().equals("plan")){
			service.Logger(jp, "searchPage plan");
		}else {
			service.Logger(jp, "searchPage total");
		}
		
		Object result = jp.proceed();
		
		return result;
		
	}

}
