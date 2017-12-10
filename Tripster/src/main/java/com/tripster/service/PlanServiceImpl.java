package com.tripster.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.PlanVO;
import com.tripster.persistence.PlanDAO;

@Service
public class PlanServiceImpl implements PlanService{

	@Inject
	private  PlanDAO planDAO;
	
	//플랜 등록.
	@Override
	public void registerPlan(PlanVO vo) throws Exception {
		planDAO.insertPlan(vo);
	}

	//플랜 수정.
	@Override
	public void modifyPlan(PlanVO vo) throws Exception {
		planDAO.updatePlan(vo);
	}

	//플랜 삭제.
	@Override
	public void removePlan(int planID) throws Exception {
		planDAO.deletePlan(planID);
	}

	//플랜 조회.
	@Override
	public PlanVO readPlan(int planID) throws Exception {
		return planDAO.selectPlan(planID);
	}

	@Override
	public int readPlanID() throws Exception {
		return planDAO.selectLastPlanID();
	}
	
	
}
