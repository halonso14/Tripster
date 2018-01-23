package com.tripster.service;

import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;


public interface EsSearchService {

	// 통합 검색결과 리스트 조회 
	public EsSearchResult getTotalSearchList(SearchCriteria cri) throws Exception;
	
	// 컨텐츠 검색결과 더보기 리스트 조회 
	public EsSearchResult getContentsSearchList(SearchCriteria cri) throws Exception;
	
	// 일정 검색결과 더보기 리스트 조회 
	public EsSearchResult getPlanSearchList(SearchCriteria cri) throws Exception;
	
	// 회원 검색결과 더보기 리스트 조회 
	public EsSearchResult getMemberSearchList(SearchCriteria cri) throws Exception;
}
