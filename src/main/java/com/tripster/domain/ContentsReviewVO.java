package com.tripster.domain;

import java.util.Arrays;
import java.util.Date;

//맛집 리뷰 클래스
public class ContentsReviewVO {
	//리뷰 작성자 ID
	private Integer memberID;
	//리뷰 대상 맛집의 ID
	private Integer contentsID;
	//맛집 리뷰 ID(pk)
	private Integer contentsReviewID;
	//맛집 리뷰 내용
	private String contentsReview;
	//맛집 리뷰 작성(수정) 시간
	private Date contentsReviewTime;
	//리뷰 사진
	private String[] reviewPictureName;

	public String[] getReviewPictureName() {
		return reviewPictureName;
	}
	public void setReviewPictureName(String[] reviewPictureName) {
		this.reviewPictureName = reviewPictureName;
	}
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
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
	public String getContentsReview() {
		return contentsReview;
	}
	public void setContentsReview(String contentsReview) {
		this.contentsReview = contentsReview;
	}
	public Date getContentsReviewTime() {
		return contentsReviewTime;
	}
	public void setContentsReviewTime(Date contentsReviewTime) {
		this.contentsReviewTime = contentsReviewTime;
	}
	@Override
	public String toString() {
		return "ContentsReviewVO [memberID=" + memberID + ", contentsID=" + contentsID + ", contentsReviewID="
				+ contentsReviewID + ", contentsReview=" + contentsReview + ", contentsReviewTime=" + contentsReviewTime
				+ ", reviewPictureName=" + Arrays.toString(reviewPictureName) + "]";
	}
}