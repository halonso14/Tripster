package com.tripster.persistence;

import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;

public interface EsPlanDAO {
	// 일정 검색결과 리스트 조회
	public EsSearchResult getPlanList(SearchCriteria cri, Integer size) throws Exception;

}
