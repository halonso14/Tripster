package com.tripster.domain;

public class DashCountryVO {

	
	//다녀온 국가iso코드
	private String visitedCountryISO;
	//다녀온 국가가 속해있는 일정 정보
	private String plan_title;
	//일정이 끝났는지 아닌지
	private int plan_endChk;
	

	public int getPlan_endChk() {
		return plan_endChk;
	}
	public void setPlan_endChk(int plan_endChk) {
		this.plan_endChk = plan_endChk;
	}
	public String getVisitedCountryISO() {
		return visitedCountryISO;
	}
	public void setVisitedCountryISO(String visitedCountryISO) {
		this.visitedCountryISO = visitedCountryISO;
	}
	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
		



}
	
