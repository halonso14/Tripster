package com.tripster.domain;

import java.util.*;
import lombok.*;

import com.fasterxml.jackson.annotation.JsonFilter;

@Data 
@JsonFilter("EsContentsFilter")
public class ContentsReviewVO {
	//리뷰 작성자 ID
	private Integer memberID;
	//리뷰 대상 맛집의 ID
	private Integer contentsID;
	//리뷰 ID(pk)
	private Integer contentsReviewID;
	//리뷰 내용
	private String contentsReview;
	//리뷰 작성(수정) 시간
	private Date contentsReviewTime;

}