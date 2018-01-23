package com.tripster.domain;

import java.util.*;

// 통합 검색결과 값 한번에 담기위한 객체 (contentsVO + planVO + memberVO)
public class EsSearchResult {
	
	private Long totalCnt;
	private Long contestsCnt;
	private Long planCnt;	
	private Long memberCnt;
	private List<EsContentsVO> contentsList;
	private List<EsPlanVO> planList;
	private List<EsMemberVO> memberList;
	
	public Long getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(Long totalCnt) {
		this.totalCnt = totalCnt;
	}
	public Long getContestsCnt() {
		return contestsCnt;
	}
	public void setContestsCnt(Long contestsCnt) {
		this.contestsCnt = contestsCnt;
	}
	public Long getPlanCnt() {
		return planCnt;
	}
	public void setPlanCnt(Long planCnt) {
		this.planCnt = planCnt;
	}
	public Long getMemberCnt() {
		return memberCnt;
	}
	public void setMemberCnt(Long memberCnt) {
		this.memberCnt = memberCnt;
	}
	public List<EsContentsVO> getContentsList() {
		return contentsList;
	}
	public void setContentsList(List<EsContentsVO> contentsList) {
		this.contentsList = contentsList;
	}
	public List<EsPlanVO> getPlanList() {
		return planList;
	}
	public void setPlanList(List<EsPlanVO> planList) {
		this.planList = planList;
	}
	public List<EsMemberVO> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<EsMemberVO> memberList) {
		this.memberList = memberList;
	}
	@Override
	public String toString() {
		return "EsSearchResult [totalCnt=" + totalCnt + ", contestsCnt=" + contestsCnt + ", planCnt=" + planCnt
				+ ", memberCnt=" + memberCnt + ", contentsList=" + contentsList + ", planList=" + planList
				+ ", memberList=" + memberList + "]";
	}

}