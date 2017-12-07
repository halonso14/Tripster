package com.tripster.domain;

import java.util.Date;

public class RestaurantReviewVO {
	private Integer memberID;
	private Integer restaurantID;
	private Integer restaurantReviewID;
	private String restaurantReview;
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