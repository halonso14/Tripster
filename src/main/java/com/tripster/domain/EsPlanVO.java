package com.tripster.domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonFilter;

//@JsonFilter("EsPlanFilter")
public class EsPlanVO extends PlanVO{
	
	private PlanDetailVO planDetail;
	
	private List<PlanReplyVO> replies;
}
