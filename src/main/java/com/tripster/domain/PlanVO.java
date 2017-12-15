package com.tripster.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class PlanVO {
	private int planID;
	private int memberID;
	private String planTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planStartDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planEndDate;
	private List<PlanDetailVO> planDetailVO;
	
	//getter() setter()
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
	public List<PlanDetailVO> getPlanDetailVO() {
		return planDetailVO;
	}
	public void setPlanDetailVO(List<PlanDetailVO> planDetailVO) {
		this.planDetailVO = planDetailVO;
	}
	
	//toString()
	@Override
	public String toString() {
		return "PlanVO [planID=" + planID + ", memberID=" + memberID + ", planTitle=" + planTitle + ", planStartDate="
				+ planStartDate + ", planEndDate=" + planEndDate + ", planDetailVO=" + planDetailVO + "]";
	}
	

	
	
	
}
