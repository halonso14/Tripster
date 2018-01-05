package com.tripster.persistence;

import java.util.*;

import com.tripster.domain.EsPlanVO;
import com.tripster.domain.SearchCriteria;

public interface EsPlanDAO {
	// 일정 검색결과 더보기 리스트 조회
	public List<EsPlanVO> getPlanList(SearchCriteria cri) throws Exception;
	// 일정 검색결과 건수 조회 
	public long getTotalPlanNum(SearchCriteria cri) throws Exception;
}
