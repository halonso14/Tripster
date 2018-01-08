package com.tripster.domain;

import java.util.List;

//@JsonFilter("EsPlanFilter")
public class EsPlanVO extends PlanVO{
	
	private PlanDetailVO planDetail;
	
	private List<PlanReplyVO> replies;
}
