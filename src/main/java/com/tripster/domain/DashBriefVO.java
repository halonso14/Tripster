package com.tripster.domain;

public class DashBriefVO {
/*member, 
 * count(planTitle) as numOfPlans, 
 * sum(days) as totalDays, 
 * CAST(avg(days) AS signed integer) as avgDays, 
 * min(days) as minPlanDays, 
 * max(days) as maxPlanDays*/
	
	//통계페이지의 지도 위쪽하고 플랜 통계
	//들른 국가 업데이트 해야함
	
	//멤버 ID
	private Integer memberID;
	//플랜갯수
	private Integer numOfPlans;
	//총여행일수
	private Integer totalDays;
	//평균여행일수
	private Integer avgDays;
	//가장 짧게 간 여행일수
	private Integer minPlanDays;
	//가장 길게 간 여행일수
	private Integer maxPlanDays;
	
	
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public Integer getNumOfPlans() {
		return numOfPlans;
	}
	public void setNumOfPlans(Integer numOfPlans) {
		this.numOfPlans = numOfPlans;
	}
	public Integer getTotalDays() {
		return totalDays;
	}
	public void setTotalDays(Integer totalDays) {
		this.totalDays = totalDays;
	}
	public Integer getAvgDays() {
		return avgDays;
	}
	public void setAvgDays(Integer avgDays) {
		this.avgDays = avgDays;
	}
	public Integer getMinPlanDays() {
		return minPlanDays;
	}
	public void setMinPlanDays(Integer minPlanDays) {
		this.minPlanDays = minPlanDays;
	}
	public Integer getMaxPlanDays() {
		return maxPlanDays;
	}
	public void setMaxPlanDays(Integer maxPlanDays) {
		this.maxPlanDays = maxPlanDays;
	}
		
	
}
	
