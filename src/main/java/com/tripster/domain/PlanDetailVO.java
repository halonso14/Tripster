package com.tripster.domain;

import com.fasterxml.jackson.annotation.JsonFilter;

@JsonFilter("EsPlanFilter")
public class PlanDetailVO {
	private int planDetailID; //일정 상세 식별 번호.
	private int planID; //일정 식별번호.
	private int contentsID; //컨텐츠 식별번호.
	private String title; //컨텐츠 제목.
	private String planDetailStartTime;	//일정 상세 시작 시간
	private String planDetailEndTime;	//일정 상세 종료 시간
	private String planDetailDate;	//일정 상세 날짜
	private int categoryID;	//카테고리 식별번호.	
	private MemoVO memoVO; 	//memo join시 사용.
	
	public int getPlanDetailID() {
		return planDetailID;
	}
	public void setPlanDetailID(int planDetailID) {
		this.planDetailID = planDetailID;
	}
	public int getPlanID() {
		return planID;
	}
	public void setPlanID(int planID) {
		this.planID = planID;
	}
	public int getContentsID() {
		return contentsID;
	}
	public void setContentsID(int contentsID) {
		this.contentsID = contentsID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlanDetailStartTime() {
		return planDetailStartTime;
	}
	public void setPlanDetailStartTime(String planDetailStartTime) {
		this.planDetailStartTime = planDetailStartTime;
	}
	public String getPlanDetailEndTime() {
		return planDetailEndTime;
	}
	public void setPlanDetailEndTime(String planDetailEndTime) {
		this.planDetailEndTime = planDetailEndTime;
	}
	public String getPlanDetailDate() {
		return planDetailDate;
	}
	public void setPlanDetailDate(String planDetailDate) {
		this.planDetailDate = planDetailDate;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public MemoVO getMemoVO() {
		return memoVO;
	}
	public void setMemoVO(MemoVO memoVO) {
		this.memoVO = memoVO;
	}
	@Override
	public String toString() {
		return "PlanDetailVO [planDetailID=" + planDetailID + ", planID=" + planID + ", contentsID=" + contentsID
				+ ", title=" + title + ", planDetailStartTime=" + planDetailStartTime + ", planDetailEndTime="
				+ planDetailEndTime + ", planDetailDate=" + planDetailDate + ", categoryID=" + categoryID + ", memoVO="
				+ memoVO + "]";
	}
}
