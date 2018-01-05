package com.tripster.domain;

import java.util.*;

// 통합 검색결과 값 한번에 담기위한 객체 (contentsVO + planVO + memberVO)
public class EsSearchResult {
	
	public List<EsContentsVO> contentsList;

	public List<EsPlanVO> planList;

	public List<EsMemberVO> memberList;
	
	

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
		return "EsSearchResult [contentsList=" + contentsList + ", planList=" + planList + ", memberList=" + memberList
				+ "]";
	}
	
}