package com.tripster.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class PlanVO {
	private int planID; //일정 식별번호.
	private int memberID; //회원 식별번호.
	private String planTitle; //일정 제목.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planStartDate; //일정 시작일.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planEndDate;// 일정 종료일.
	public int planEndChk; //일정완료여부.(0:미완료 / 1:완료)
	private List<PlanDetailVO> planDetailVO; //planDetail join시 사용.
	private String memberName; //회원 이름조회.
	private String memberPictureName; //es 데이터동기화
	public String getMemberPictureName() {
		return memberPictureName;
	}
	public void setMemberPictureName(String memberPictureName) {
		this.memberPictureName = memberPictureName;
	}
	private int planLikeCnt; //좋아요 카운트
	private String pictureName;
	private Date created;
	private Date updated;
	
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
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
	public List<PlanDetailVO> getPlanDetailVO() {
		return planDetailVO;
	}
	public void setPlanDetailVO(List<PlanDetailVO> planDetailVO) {
		this.planDetailVO = planDetailVO;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getPlanLikeCnt() {
		return planLikeCnt;
	}
	public void setPlanLikeCnt(int planLikeCnt) {
		this.planLikeCnt = planLikeCnt;
	}
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	@Override
	public String toString() {
		return "PlanVO [planID=" + planID + ", memberID=" + memberID + ", planTitle=" + planTitle + ", planStartDate="
				+ planStartDate + ", planEndDate=" + planEndDate + ", planEndChk=" + planEndChk + ", planDetailVO="
				+ planDetailVO + ", memberName=" + memberName + ", planLikeCnt=" + planLikeCnt + ", pictureName="
				+ pictureName + "]";
	}
	
}
