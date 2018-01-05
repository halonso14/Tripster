package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.EsContentsVO;
import com.tripster.domain.SearchCriteria;

public interface EsContentsDAO {
	// 컨텐츠 검색결과 더보기 리스트 조회
	public List<EsContentsVO> getContentsList(SearchCriteria cri) throws Exception;
	// 컨텐츠 검색결과 건수 조회
	public long getTotalContentsNum(SearchCriteria cri) throws Exception;
}

