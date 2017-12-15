package com.tripster.domain;

public class RestaurantVO {
	//맛집ID
	private Integer restaurantID;
	//맛집 이름
	private String title;
	//맛집 위치
	private String location;
	//맛집 평가
	private int rating;
	//맛집 영업 시간
	private String time;
	//맛집 상세 정보
	private String contents;
	//맛집 전화 번호
	private String tel;
	//서비스 카테고리 분류 코드
	private int codeID;
//  private int viewCount; 	
	
	public Integer getRestaurantID() {
		return restaurantID;
	}
	public void setRestaurantID(int restaurantID) {
		this.restaurantID = restaurantID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getCodeID() {
		return codeID;
	}
	public void setCodeID(int codeID) {
		this.codeID = codeID;
	}
	@Override
	public String toString() {
		return "RestaurantVO [restaurantID=" + restaurantID + ", title=" + title + ", location=" + location
				+ ", rating=" + rating + ", time=" + time + ", contents=" + contents + ", tel=" + tel + ", codeID="
				+ codeID + "]";
	}
}