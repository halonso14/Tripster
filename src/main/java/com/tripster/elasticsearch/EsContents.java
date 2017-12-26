package com.tripster.elasticsearch;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NON_PRIVATE)
public class EsContents {
	//컨텐츠 ID
	@JsonProperty("contentsId")
	Integer contentsID;
	
	//컨텐츠 카테고리 분류 코드
	@JsonProperty("categoryId")
	int categoryID;
	
	//컨텐츠 이름
	@JsonProperty("title")
	String title;
	
	//컨텐츠 상세 정보
	@JsonProperty("contents")
	String contents;
	
	//컨텐츠 상세 정보 조회수
	@JsonProperty("contentsViewCnt")
	Integer contentsViewCnt;
	
	//컨텐츠 리뷰 개수
	@JsonProperty("contentsReviewCnt")
	Integer contentsReviewCnt;
	
	//컨텐츠 스크랩 개수
	@JsonProperty("contentsScrapCnt")
	Integer contentsScrapCnt;
}
