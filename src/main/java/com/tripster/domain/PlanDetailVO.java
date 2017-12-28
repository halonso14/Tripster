package com.tripster.domain;

import lombok.*;

import com.fasterxml.jackson.annotation.JsonFilter;

@Data 
@JsonFilter("EsPlanFilter")
public class PlanDetailVO {
	private int planDetailID; //일정 상세 식별 번호.
	private int planID; //일정 식별번호.
	private int contentsID; //컨텐츠 식별번호.
	private String title; //컨텐츠 제목.
	private String planDetailStartTime;	//일정 상세 시작 시간
	private String planDetailEndTime;	//일정 상세 종료 시간
	private String planDetailDate;	//일정 상세 날짜
	private int categoryID;	//카테고리 식별번호.	
	private MemoVO memoVO; 	//memo join시 사용.
	
}
