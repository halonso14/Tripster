package com.tripster.domain;

public class ContentsVO {
	//컨텐츠 ID
	private Integer contentsID;	
	//컨텐츠 카테고리 분류 코드
	private int categoryID;	
	//컨텐츠 제목
	private String title;
	//컨텐츠 키워드 
	private String keyword;
	//컨텐츠 주소
	private String location;
	//컨텐츠 위치 국가
	private String country;
	//컨텐츠 위치 도시
	private String city;
	//컨텐츠 평점
	private double rating;
	//컨텐츠 상세 정보 조회수
	private Integer contentsViewCnt;
	//컨텐츠 리뷰 개수
	private Integer contentsReviewCnt;
	//컨텐츠 스크랩 개수
	private Integer contentsScrapCnt;
	//컨텐츠 섬네일 
	private String contentsThumbnail;
	//영업 시간
	private String time;
	//컨텐츠 전화 번호
	private String tel;
	//컨텐츠 위치 위도
	private String lat;
	//컨텐츠 위치 경도
	private String lng;
	public Integer getContentsID() {
		return contentsID;
	}
	public void setContentsID(Integer contentsID) {
		this.contentsID = contentsID;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeyword() {
		this.keyword = this.keyword.replace("['", "").replace("]'", "").replace("'", "").replace("_"," ");
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Integer getContentsViewCnt() {
		return contentsViewCnt;
	}
	public void setContentsViewCnt(Integer contentsViewCnt) {
		this.contentsViewCnt = contentsViewCnt;
	}
	public Integer getContentsReviewCnt() {
		return contentsReviewCnt;
	}
	public void setContentsReviewCnt(Integer contentsReviewCnt) {
		this.contentsReviewCnt = contentsReviewCnt;
	}
	public Integer getContentsScrapCnt() {
		return contentsScrapCnt;
	}
	public void setContentsScrapCnt(Integer contentsScrapCnt) {
		this.contentsScrapCnt = contentsScrapCnt;
	}
	public String getContentsThumbnail() {
		return contentsThumbnail;
	}
	public void setTumb(String contentsThumbnail) {
		this.contentsThumbnail = contentsThumbnail;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	@Override
	public String toString() {
		return "ContentsVO [contentsID=" + contentsID + ", categoryID=" + categoryID + ", title=" + title + ", keyword="
				+ keyword + ", location=" + location + ", country=" + country + ", city=" + city + ", rating=" + rating
				+ ", contentsViewCnt=" + contentsViewCnt + ", contentsReviewCnt=" + contentsReviewCnt
				+ ", contentsScrapCnt=" + contentsScrapCnt + ", contentsThumbnail=" + contentsThumbnail + ", time=" + time + ", tel=" + tel
				+ ", lat=" + lat + ", lng=" + lng + "]";
	}
}