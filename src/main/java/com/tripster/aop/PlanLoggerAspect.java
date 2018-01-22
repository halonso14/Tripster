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
public class PlanLoggerAspect {

	@Inject
	LoggerService service;
	
	private static final Logger loger = LoggerFactory.getLogger(MemberLoggerAspect.class);
	
	// 일정 제목 및 날짜 등록 페이지
	@Around("execution(* com.tripster.controller.PlanController.registerGET(..))")
	public Object registerGET(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "plan title & date regist page");
		
		return result;
		
	}
	
	// 일정 제목 및 날짜 등록
	@Around("execution(* com.tripster.controller.PlanController.registerPOST(..))")
	public Object registerPOST(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "plan title & date regist");
		
		return result;
		
	}
	
	//  일정 조회
	@Around("execution(* com.tripster.controller.PlanController.readPlan(..))")
	public Object readPlan(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "read Plan");
		
		return result;
		
	}	
	
	// 일정 제목 & 일정 날짜 수정
	@Around("execution(* com.tripster.controller.PlanController.updateTitleAndDetail(..))")
	public Object updateTitleAndDetail(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "update title and date");
		
		return result;
		
	}
	
	// 일정 수정 페이지 이동
	@Around("execution(* com.tripster.controller.PlanController.updatePlanGET(..))")
	public Object updatePlanGET(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "update plan page");
		
		return result;
		
	}
	
	// 일정 전체 삭제
	@Around("execution(* com.tripster.controller.PlanController.deletePlan(..))")
	public Object deletePlan(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "delete Plan");
		
		return result;
		
	}
	
	// 내가 등록한 일정 조회페이지
//	@Around("execution(* com.tripster.controller.PlanController.myplan(..))")
//	public Object myplan(ProceedingJoinPoint jp) throws Throwable {
//		
//		Object result = jp.proceed();
//		service.Logger(jp, "myplan list page");
//		
//		return result;
//		
//	}
	
	// 일정 상세 페이지
	@Around("execution(* com.tripster.controller.PlanController.detailForm(..))")
	public Object detailForm(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "plan detail page");
		
		return result;
		
	}
	
	// 일정 상세 등록
	@Around("execution(* com.tripster.controller.PlanController.detailRegister(..))")
	public Object detailRegister(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "plan detail regist");
		
		return result;
		
	}
		
	// 등록한 컨텐츠 일정 날짜 및 시간 수정
	@Around("execution(* com.tripster.controller.PlanController.updateDetail(..))")
	public Object updateDetail(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "plan detail update");
		
		return result;
		
	}
	
	// 등록한 컨텐츠 일정 삭제
	@Around("execution(* com.tripster.controller.PlanController.deleteDetail(..))")
	public Object deleteDetail(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "plan detail delete");
		
		return result;
		
	}
	
	// 사용자 지정 컨텐츠 일정 등록.
	@Around("execution(* com.tripster.controller.PlanController.registerUserDetail(..))")
	public Object registerUserDetail(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "regist user contents detail");
		
		return result;
		
	}
	
	// 메모 등록
	@Around("execution(* com.tripster.controller.PlanController.registerMemo(..))")
	public Object registerMemo(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "regist memo");
		
		return result;
		
	}	
	
	// 메모 조회
	@Around("execution(* com.tripster.controller.PlanController.readMemo(..))")
	public Object readMemo(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "readMemo");
		
		return result;
		
	}	
	
	// 메모 수정
	@Around("execution(* com.tripster.controller.PlanController.updateMemo(..))")
	public Object updateMemo(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "updateMemo");
		
		return result;
		
	}
	
	// 메모 삭제
	@Around("execution(* com.tripster.controller.PlanController.deleteMemo(..))")
	public Object deleteMemo(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "deleteMemo");
		
		return result;
		
	}
	
	// 댓글 등록
	@Around("execution(* com.tripster.controller.PlanController.registerReply(..))")
	public Object registerReply(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "regist Reply");
		
		return result;
		
	}
	
	// 댓글 수정
	@Around("execution(* com.tripster.controller.PlanController.updateReply(..))")
	public Object updateReply(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "update Reply");
		
		return result;
		
	}
	
	// 댓글 삭제
	@Around("execution(* com.tripster.controller.PlanController.deleteReply(..))")
	public Object deleteReply(ProceedingJoinPoint jp) throws Throwable {
		
		Object result = jp.proceed();
		service.Logger(jp, "delete Reply");
		
		return result;
		
	}
	
}
