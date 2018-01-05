package com.tripster.domain;

import java.util.*;
import com.fasterxml.jackson.annotation.JsonFilter;

import com.tripster.domain.ContentsReviewVO;

@JsonFilter("EsContentsFilter")
public class EsContentsVO extends ContentsVO{

	private HashMap<String,String> contentsDetail;
	
	private List<ContentsReviewVO> ContentsReviewVO;
	
}		


