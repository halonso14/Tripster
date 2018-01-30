package com.tripster.service;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.EsPlanVO;
import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.SearchCriteria;


public interface EsSearchService {

	// 통합 검색결과 리스트 조회 
	public EsSearchResultVO getTotalSearchList(SearchCriteria cri) throws Exception;
	
	// 컨텐츠 검색결과 더보기 리스트 조회 
	public EsSearchResultVO getContentsSearchList(SearchCriteria cri) throws Exception;
	
	// 일정 검색결과 더보기 리스트 조회 
	public EsSearchResultVO getPlanSearchList(SearchCriteria cri) throws Exception;
	
	// 회원 검색결과 더보기 리스트 조회 
	public EsSearchResultVO getMemberSearchList(SearchCriteria cri) throws Exception;

}
