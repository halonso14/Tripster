package com.tripster.domain;

import java.util.Date;

//맛집 리뷰 클래스
public class PlaceReviewVO {
	//리뷰 작성자 ID
	private Integer memberID;
	//리뷰 대상 맛집의 ID
	private Integer placeID;
	//맛집 리뷰 ID(pk)
	private Integer placeReviewID;
	//맛집 리뷰 내용
	private String placeReview;
	//맛집 리뷰 작성(수정) 시간
	private Date placeReviewTime;
	
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public Integer getPlaceID() {
		return placeID;
	}
	public void setPlaceID(Integer placeID) {
		this.placeID = placeID;
	}
	public Integer getPlaceReviewID() {
		return placeReviewID;
	}
	public void setPlaceReviewID(Integer placeReviewID) {
		this.placeReviewID = placeReviewID;
	}
	public String getPlaceReview() {
		return placeReview;
	}
	public void setPlaceReview(String placeReview) {
		this.placeReview = placeReview;
	}
	public Date getPlaceReviewTime() {
		return placeReviewTime;
	}
	public void setPlaceReviewTime(Date placeReviewTime) {
		this.placeReviewTime = placeReviewTime;
	}
	@Override
	public String toString() {
		return "PlaceReviewVO [memberID=" + memberID + ", placeID=" + placeID + ", placeReviewID="
				+ placeReviewID + ", placeReview=" + placeReview + ", placeReviewTime="
				+ placeReviewTime + "]";
	}
}