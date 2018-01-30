package com.tripster.persistence;

import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.PlanVO;
import com.tripster.domain.SearchCriteria;

public interface EsPlanDAO {
	// 일정 검색결과 리스트 조회
	public EsSearchResultVO getPlanList(SearchCriteria cri, Integer size) throws Exception;
	// 일정등록
	public void insertPlan(PlanVO vo) throws Exception;
}
