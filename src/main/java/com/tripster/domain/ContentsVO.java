package com.tripster.domain;

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
	
	public Integer getContentsID() {
		return contentsID;
	}
	public void setContentsID(Integer contentsID) {
		this.contentsID = contentsID;
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
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
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
	@Override
	public String toString() {
		return "ContentsVO [contentsID=" + contentsID + ", title=" + title + ", location=" + location + ", rating="
				+ rating + ", time=" + time + ", contents=" + contents + ", tel=" + tel + ", categoryID=" + categoryID
				+ ", contentsViewCnt=" + contentsViewCnt + ", contentsReviewCnt=" + contentsReviewCnt
				+ ", contentsScrapCnt=" + contentsScrapCnt + "]";
	}
	
}