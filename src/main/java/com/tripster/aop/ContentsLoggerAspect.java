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
public class ContentsLoggerAspect {

	@Inject
	LoggerService service;
	
	private static final Logger loger = LoggerFactory.getLogger(MemberLoggerAspect.class);
	
	// 컨텐츠 페이지 조회
	@Around("execution(* com.tripster.controller.ContentsController.restaurantDetail(..))")
	public Object restaurantDetail(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "contents Page");
		
		return result;
		
	}
	
	// 리뷰 작성
	@Around("execution(* com.tripster.controller.ContentsController.writeReview(..))")
	public Object writeReview(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "Write Review");
		
		return result;
		
	}
	
	// 리뷰 수정
	@Around("execution(* com.tripster.controller.ContentsController.modifyReview(..))")
	public Object modifyReview(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "Modify Review");
		
		return result;
		
	}
	
	// 리뷰 삭제
	@Around("execution(* com.tripster.controller.ContentsController.deleteReview(..))")
	public Object deleteReview(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "Delete Review");
		
		return result;
		
	}
	
}
