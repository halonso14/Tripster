package com.tripster.domain;

import java.util.*;
import lombok.*;

import org.springframework.format.annotation.DateTimeFormat;

@Data 
public class PlanVO {
	private int planID; //일정 식별번호.
	private int memberID; //회원 식별번호.
	private String planTitle; //일정 제목.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planStartDate; //일정 시작일.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planEndDate;// 일정 종료일.
	public int planEndChk; //일정완료여부.
	private List<PlanDetailVO> planDetailVO; //planDetail join시 사용.
	
}	
	

