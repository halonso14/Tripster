package com.tripster.domain;

import java.util.Date;

public class PlanReplyVO {
	private int planReplyID;
	private int planID;
	private int memberID;
	private String memberName;
	private String planReplyContents;
	private Date planReplyTime;
	
	
	
	public int getPlanReplyID() {
		return planReplyID;
	}



	public void setPlanReplyID(int planReplyID) {
		this.planReplyID = planReplyID;
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



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getPlanReplyContents() {
		return planReplyContents;
	}



	public void setPlanReplyContents(String planReplyContents) {
		this.planReplyContents = planReplyContents;
	}



	public Date getPlanReplyTime() {
		return planReplyTime;
	}



	public void setPlanReplyTime(Date planReplyTime) {
		this.planReplyTime = planReplyTime;
	}



	@Override
	public String toString() {
		return "PlanReplyVO [planReplyID=" + planReplyID + ", planID=" + planID + ", memberID=" + memberID
				+ ", memberName=" + memberName + ", planReplyContents=" + planReplyContents + ", planReplyTime="
				+ planReplyTime + "]";
	}


	
}