package com.tripster.service;

import java.util.List;

import com.tripster.domain.PlanVO;

public interface PlanService {
	
	//플랜 등록.
	public void registerPlan(PlanVO vo) throws Exception;
	
	//플랜 수정.
	public void modifyPlan(PlanVO vo)throws Exception;
	
	//플랜 삭제.
	public void removePlan(int planID)throws Exception;
	
	//플랜 조회.
	public PlanVO readPlan(int planID)throws Exception;
	
	//가장 최근에 저장된 플랜의 id값 조회.
	public int readPlanID()throws Exception;
	
	//나의 플랜 조회
	public List<PlanVO> myPlan(int memberID) throws Exception;
}
