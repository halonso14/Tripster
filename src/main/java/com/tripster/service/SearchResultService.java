package com.tripster.service;

import java.util.List;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.PlanVO;
import com.tripster.domain.MemberVO;

import com.tripster.domain.SearchCriteria;

public interface SearchResultService {
	
	public List<ContentsVO> getRestaurantList(SearchCriteria cri) throws Exception;
	
//	public List<PlanVO> getPlanResultList(SearchCriteria cri) throws Exception;
//	
//	public List<MemberVO> getMemberResultList(SearchCriteria cri) throws Exception;
	
	
}
