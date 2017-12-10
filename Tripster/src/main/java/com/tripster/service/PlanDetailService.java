package com.tripster.service;

import java.util.List;

import com.tripster.domain.PlanDetailVO;

public interface PlanDetailService {
	//일정 상세 정보 등록.
	public void registerPlanDetail(PlanDetailVO vo);
	
	//일정 상세 정보 수정.
	public void modifyPlanDetail(PlanDetailVO vo);
	
	//일정 상세 정보 삭제.
	public void deletePlanDetail(int planDetailID);
	
	//일정 삭제 시, 모든 일정 상세 정보 삭제.
	public void deleteAllPlanDetail(int planID);
	
	//모든 일정 조회
	public List<PlanDetailVO> readAllPlanDetail(int planID);
}
