package com.tripster.domain;

public class RestaurantVO {
	private Integer restaurantID;
	private String title;
	private String location;
	private int rating;
	private String time;
	private String contents;
	private String tel;
	private int codeID;
	
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