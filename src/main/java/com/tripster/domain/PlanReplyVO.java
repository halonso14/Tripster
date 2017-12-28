package com.tripster.domain;

import java.util.*;
import lombok.*;
import lombok.*;

import com.fasterxml.jackson.annotation.JsonFilter;

@Data 
@JsonFilter("EsPlanFilter")
public class PlanReplyVO {
	private int planReplyID;
	private int planID;
	private int memberID;
	private String planReplyContents;
	private Date planReplyTime;
	
}
