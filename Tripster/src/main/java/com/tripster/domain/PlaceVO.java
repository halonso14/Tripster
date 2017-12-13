package com.tripster.domain;

public class PlaceVO {
	//관광지 ID
	private Integer placeID;
	//관광지 이름
	private String title;
	//관광지 위치
	private String location;
	//관광지 평가
	private int rating;
	//관광지 관람 시간
	private String time;
	//관광지 상세 정보
	private String contents;
	//관광지 전화 번호
	private String tel;
	//관광지 카테고리 분류 코드
	private int codeID;
	//관광지 상세 정보 조회수
	private Integer placeViewCnt;
	//관광지 리뷰 개수
	private Integer placeReviewCnt;
	public Integer getPlaceID() {
		return placeID;
	}
	
	public void setPlaceID(Integer placeID) {
		this.placeID = placeID;
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
	public Integer getPlaceViewCnt() {
		return placeViewCnt;
	}
	public void setPlaceViewCnt(Integer placeViewCnt) {
		this.placeViewCnt = placeViewCnt;
	}
	public Integer getPlaceReviewCnt() {
		return placeReviewCnt;
	}
	public void setPlaceReviewCnt(Integer placeReviewCnt) {
		this.placeReviewCnt = placeReviewCnt;
	}
	
	@Override
	public String toString() {
		return "PlaceVO [placeID=" + placeID + ", title=" + title + ", location=" + location + ", rating=" + rating
				+ ", time=" + time + ", contents=" + contents + ", tel=" + tel + ", codeID=" + codeID
				+ ", placeViewCnt=" + placeViewCnt + ", placeReviewCnt=" + placeReviewCnt + "]";
	}
}