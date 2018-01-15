package com.tripster.domain;

import java.util.*;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFilter;

import com.tripster.domain.PlanDetailVO;
import com.tripster.domain.PlanReplyVO;

@JsonFilter("EsPlanFilter")
public class EsPlanVO{
	
	private int plan_id; //일정 식별번호.
	private int member_id; //회원 식별번호.
	private String plan_title; //일정 제목.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date plan_startdate; //일정 시작일.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date plan_enddate;// 일정 종료일.
	public int plan_endchk; //일정완료여부.
	private List<PlanDetailVO> planDetailVO; //planDetail join시 사용.
	private String memberName;
	private List<PlanReplyVO> replies;
	
	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}

	public Date getPlan_startdate() {
		return plan_startdate;
	}

	public void setPlan_startdate(Date plan_startdate) {
		this.plan_startdate = plan_startdate;
	}

	public Date getPlan_enddate() {
		return plan_enddate;
	}

	public void setPlan_enddate(Date plan_enddate) {
		this.plan_enddate = plan_enddate;
	}

	public int getPlan_endchk() {
		return plan_endchk;
	}

	public void setPlan_endchk(int plan_endchk) {
		this.plan_endchk = plan_endchk;
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

	public List<PlanReplyVO> getReplies() {
		return replies;
	}

	public void setReplies(List<PlanReplyVO> replies) {
		this.replies = replies;
	}

	@Override
	public String toString() {
		return "EsPlanVO [plan_id=" + plan_id + ", member_id=" + member_id + ", plan_title=" + plan_title
				+ ", plan_startdate=" + plan_startdate + ", plan_enddate=" + plan_enddate + ", plan_endchk="
				+ plan_endchk + ", planDetailVO=" + planDetailVO + ", memberName=" + memberName + ", replies=" + replies
				+ "]";
	}
	
	

}
