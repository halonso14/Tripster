package com.tripster.domain;

import java.util.Date;

//맛집 리뷰 클래스
public class RestaurantReviewVO {
	//리뷰 작성자 ID
	private Integer memberID;
	//리뷰 대상 맛집의 ID
	private Integer restaurantID;
	//맛집 리뷰 ID(pk)
	private Integer restaurantReviewID;
	//맛집 리뷰 내용
	private String restaurantReview;
	//맛집 리뷰 작성(수정) 시간
	private Date restaurantReviewTime;
	
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public Integer getRestaurantID() {
		return restaurantID;
	}
	public void setRestaurantID(Integer restaurantID) {
		this.restaurantID = restaurantID;
	}
	public Integer getRestaurantReviewID() {
		return restaurantReviewID;
	}
	public void setRestaurantReviewID(Integer restaurantReviewID) {
		this.restaurantReviewID = restaurantReviewID;
	}
	public String getRestaurantReview() {
		return restaurantReview;
	}
	public void setRestaurantReview(String restaurantReview) {
		this.restaurantReview = restaurantReview;
	}
	public Date getRestaurantReviewTime() {
		return restaurantReviewTime;
	}
	public void setRestaurantReviewTime(Date restaurantReviewTime) {
		this.restaurantReviewTime = restaurantReviewTime;
	}
	@Override
	public String toString() {
		return "RestaurantReviewVO [memberID=" + memberID + ", restaurantID=" + restaurantID + ", restaurantReviewID="
				+ restaurantReviewID + ", restaurantReview=" + restaurantReview + ", restaurantReviewTime="
				+ restaurantReviewTime + "]";
	}
}