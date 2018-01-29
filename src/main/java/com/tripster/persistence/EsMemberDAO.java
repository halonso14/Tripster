package com.tripster.persistence;

import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.SearchCriteria;

public interface EsMemberDAO {
	// 유저 검색결과 리스트 조회
	public EsSearchResultVO getMemberList(SearchCriteria cri, Integer size) throws Exception;

}
