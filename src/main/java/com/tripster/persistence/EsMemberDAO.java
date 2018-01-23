package com.tripster.persistence;

import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;

public interface EsMemberDAO {
	// 유저 검색결과 리스트 조회
	public EsSearchResult getMemberList(SearchCriteria cri, Integer size) throws Exception;

}
