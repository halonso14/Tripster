package com.tripster.domain;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

//맛집 리뷰 클래스
public class ContentsReviewVO {
	//리뷰 작성자 ID
	private Integer memberID;
	//리뷰 작성자 이름
	private String memberName;
	//리뷰 대상 맛집의 ID
	private Integer contentsID;
	//맛집 리뷰 ID(pk)
	private Integer contentsReviewID;
	//맛집 리뷰 제목
	private String contentsReviewTitle;
	//맛집 리뷰 내용
	private String contentsReview;
	//리뷰 평점
	private double contentsReviewRating;
	//리뷰 사진
	private List<String> reviewPictureName;
	//회원 사진
	private String memberPictureName;
	//리뷰 작성/수정 일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedDate;
	
	public Integer getMemberID() {
		return memberID;
	}
	public String getMemberPictureName() {
		return memberPictureName;
	}
	public void setMemberPictureName(String memberPictureName) {
		this.memberPictureName = memberPictureName;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Integer getContentsID() {
		return contentsID;
	}
	public void setContentsID(Integer contentsID) {
		this.contentsID = contentsID;
	}
	public Integer getContentsReviewID() {
		return contentsReviewID;
	}
	public void setContentsReviewID(Integer contentsReviewID) {
		this.contentsReviewID = contentsReviewID;
	}
	public String getContentsReviewTitle() {
		return contentsReviewTitle;
	}
	public void setContentsReviewTitle(String contentsReviewTitle) {
		this.contentsReviewTitle = contentsReviewTitle;
	}
	public String getContentsReview() {
		return contentsReview;
	}
	public void setContentsReview(String contentsReview) {
		this.contentsReview = contentsReview;
	}
	public double getContentsReviewRating() {
		return contentsReviewRating;
	}
	public void setContentsReviewRating(double contentsReviewRating) {
		this.contentsReviewRating = contentsReviewRating;
	}
	public List<String> getReviewPictureName() {
		return reviewPictureName;
	}
	public void setReviewPictureName(List<String> reviewPictureName) {
		this.reviewPictureName = reviewPictureName;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	@Override
	public String toString() {
		return "ContentsReviewVO [memberID=" + memberID + ", memberName=" + memberName + ", contentsID=" + contentsID
				+ ", contentsReviewID=" + contentsReviewID + ", contentsReviewTitle=" + contentsReviewTitle
				+ ", contentsReview=" + contentsReview + ", contentsReviewRating=" + contentsReviewRating
				+ ", reviewPictureName=" + reviewPictureName + ", memberPictureName=" + memberPictureName
				+ ", updatedDate=" + updatedDate + "]";
	}
}