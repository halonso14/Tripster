package com.tripster.domain;

import java.util.*;
import lombok.*;

import com.fasterxml.jackson.annotation.JsonFilter;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.domain.EsContentsDetailVO;

@Data
@JsonFilter("EsContentsFilter")
public class EsContentsVO extends ContentsVO{

	private EsContentsDetailVO EsContentsDetailVO;
	
	private List<ContentsReviewVO> ContentsReviewVO;
	
}		


