package com.tripster.service;

import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;


public interface EsSearchService {

	// 통합검색결과 리스트 조회 
	public EsSearchResult getTotalSearchList(SearchCriteria cri) throws Exception;
	// 통합검색결과 건수 조회 
	public long getTotalSearchNum(SearchCriteria cri) throws Exception;	
	
}
