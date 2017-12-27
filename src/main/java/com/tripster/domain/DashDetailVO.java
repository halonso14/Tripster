package com.tripster.domain;

public class DashDetailVO {

	//플랜번호
	private Integer plan_id;
	//플랜제목
	private String plan_title;
	//총여행일수
	private String numAges_who_chose_plan_id;
	//평균여행일수
	private Integer num;
	//가장 짧게 간 여행일수
	private String sex;
	
	
	public Integer getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(Integer plan_id) {
		this.plan_id = plan_id;
	}
	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	public String getNumAges_who_chose_plan_id() {
		return numAges_who_chose_plan_id;
	}
	public void setNumAges_who_chose_plan_id(String numAges_who_chose_plan_id) {
		this.numAges_who_chose_plan_id = numAges_who_chose_plan_id;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}

	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}


	
}
	
