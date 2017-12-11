package com.tripster.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PlanDetailVO {
	private int planDetailID;
	private int planID;
	private int contentsID;
	private String title;
	private String planDetailStartTime;
	private String planDetailDate;
	private int codeID;
	
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
	public String getPlanDetailDate() {
		return planDetailDate;
	}
	public void setPlanDetailDate(String planDetailDate) {
		this.planDetailDate = planDetailDate;
	}
	public int getCodeID() {
		return codeID;
	}
	public void setCodeID(int codeID) {
		this.codeID = codeID;
	}
	@Override
	public String toString() {
		return "PlanDetailVO [planDetailID=" + planDetailID + ", planID=" + planID + ", contentsID=" + contentsID
				+ ", title=" + title + ", planDetailStartTime=" + planDetailStartTime + ", planDetailDate="
				+ planDetailDate + ", codeID=" + codeID + "]";
	}
	
	
	
	
	
	
}
