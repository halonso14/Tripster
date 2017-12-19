package com.tripster.service;

import java.util.List;
import java.util.Map;

import com.tripster.domain.PlanDetailVO;

public interface PlanDetailService {
	//일정 상세 정보 등록.
	public void registerPlanDetail(PlanDetailVO vo)throws Exception;
	
	//일정 상세 정보 수정.
	public void modifyPlanDetail(Map<String,Object> map)throws Exception;
	
	//일정 상세 정보 삭제.
	public void deletePlanDetail(int planDetailID)throws Exception;
	
//	//일정 삭제 시, 모든 일정 상세 정보 삭제.
//	public void deleteAllPlanDetail(int planID)throws Exception;
	
	//모든 일정 조회
	public List<PlanDetailVO> readAllPlanDetail(int planID)throws Exception;
	
	//최근 등록된 일정 상세의 id 값 조회
	public int readPlanDetailID()throws Exception;
}
