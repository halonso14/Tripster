package com.tripster.persistence;

import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;
import com.tripster.domain.PlanDetailVO;
import com.tripster.domain.SearchCriteria;

public interface EsPlanDAO {
	// 일정 검색결과 리스트 조회
	public EsSearchResultVO getPlanList(SearchCriteria cri, Integer size) throws Exception;
	// 일정등록
	public void insertEsPlan(PlanVO vo, int planID) throws Exception;
	
	 // 일정상세의 사진이 등록될때 일정대표사진으로 업데이트 
    public void updateEsPlan(String planID, String pictureName) throws Exception;
    
    // 일정삭제 
    public void deleteEsPlan(String planID) throws Exception;
}
