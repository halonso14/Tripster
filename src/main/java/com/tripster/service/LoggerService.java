package com.tripster.service;

import org.aspectj.lang.ProceedingJoinPoint;

public interface LoggerService {

	public void Logger(ProceedingJoinPoint jp,String page) throws Exception;
	
}
