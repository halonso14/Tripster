package com.tripster.domain;

public class DashLikeVO {

	//멤버 ID
	//private Integer memberID;
	//플랜번호
	//private Integer plan_id;
	
	//플랜제목
	private String plan_title;
		
	//좋아요 수
	private Integer num;
	

	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}

	

	
}
	
