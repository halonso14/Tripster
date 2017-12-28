package com.tripster.domain;

import java.util.*;
import lombok.*;

import com.fasterxml.jackson.annotation.JsonFilter;

import com.tripster.domain.PlanDetailVO;
import com.tripster.domain.PlanReplyVO;

@Data
@JsonFilter("EsPlanFilter")
public class EsPlanVO extends PlanVO{
	
	private PlanDetailVO planDetail;
	
	private List<PlanReplyVO> replies;
}
