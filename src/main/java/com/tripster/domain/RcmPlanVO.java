package com.tripster.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RcmPlanVO {

	private int planID; //일정 식별번호.
	private int memberID; //회원 식별번호.
	private String planTitle; //일정 제목.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planStartDate; //일정 시작일.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planEndDate;// 일정 종료일.
	public int planEndChk; //일정완료여부.
	private String memberName; //일정 만든 회원이름.
	private String memberPic; //일정 만든 회원 썸네일.

	private String planStartDateNewFormat; //일정 시작일 2017/12/12 포맷형식.
	private String planEndDateNewFormat;// 일정 종료일 2017/12/12 포맷형식..
	
	
	
	public String getPlanStartDateNewFormat() {
		return planStartDateNewFormat;
	}
	public void setPlanStartDateNewFormat(String planStartDateNewFormat) {
		this.planStartDateNewFormat = planStartDateNewFormat;
	}
	public String getPlanEndDateNewFormat() {
		return planEndDateNewFormat;
	}
	public void setPlanEndDateNewFormat(String planEndDateNewFormat) {
		this.planEndDateNewFormat = planEndDateNewFormat;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}
	public int getPlanID() {
		return planID;
	}
	public void setPlanID(int planID) {
		this.planID = planID;
	}
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public String getPlanTitle() {
		return planTitle;
	}
	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}
	public Date getPlanStartDate() {
		return planStartDate;
	}
	public void setPlanStartDate(Date planStartDate) {
		this.planStartDate = planStartDate;
	}
	public Date getPlanEndDate() {
		return planEndDate;
	}
	public void setPlanEndDate(Date planEndDate) {
		this.planEndDate = planEndDate;
	}
	public int getPlanEndChk() {
		return planEndChk;
	}
	public void setPlanEndChk(int planEndChk) {
		this.planEndChk = planEndChk;
	}

	

}