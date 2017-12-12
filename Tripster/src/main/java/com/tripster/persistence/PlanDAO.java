package com.tripster.persistence;

import com.tripster.domain.PlanVO;

public interface PlanDAO {
	//일정 등록.
	public void insertPlan(PlanVO vo);
	
	//일정 수정.
	public void updatePlan(PlanVO planVO);
	
	//일정 삭제.
	public void deletePlan(int planID);
	
	//일정 조회.
	public PlanVO selectPlan(int planID);
	
	//가장 최근에 저장된 일정 ID값 조회.
	public int selectLastPlanID();
	
}
