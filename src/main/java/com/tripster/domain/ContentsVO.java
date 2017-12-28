package com.tripster.domain;

import lombok.*;

@Data 
public class ContentsVO {
	//컨텐츠 ID
	private Integer contentsID;	
	//컨텐츠 이름
	private String title;	
	//컨텐츠 위치
	private String location;
	//컨텐츠 평가
	private int rating;	
	//컨텐츠 이용 시간
	private String time;
	//컨텐츠 상세 정보
	private String contents;
	//컨텐츠 전화 번호
	private String tel;	
	//컨텐츠 카테고리 분류 코드
	private int categoryID;	
	//컨텐츠 상세 정보 조회수
	private Integer contentsViewCnt;
	//컨텐츠 리뷰 개수
	private Integer contentsReviewCnt;
	//컨텐츠 스크랩 개수
	private Integer contentsScrapCnt;
	
}