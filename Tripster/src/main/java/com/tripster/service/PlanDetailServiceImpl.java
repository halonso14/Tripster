package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.PlanDetailVO;
import com.tripster.persistence.PlanDetailDAO;

@Service
public class PlanDetailServiceImpl implements PlanDetailService{

	@Inject
	private PlanDetailDAO planDetailDAO;
	
	@Override
	public void registerPlanDetail(PlanDetailVO vo) {
		System.out.println("service당!!!");
		planDetailDAO.insertPlanDetail(vo);
		
	}

	@Override
	public void modifyPlanDetail(PlanDetailVO vo) {
		planDetailDAO.updatePlanDetail(vo);
		
	}

	@Override
	public void deletePlanDetail(int planDetailID) {
		planDetailDAO.deletePlanDetail(planDetailID);
		
	}

	@Override
	public void deleteAllPlanDetail(int planID) {
		planDetailDAO.deleteAllByPlanID(planID);
	}

	@Override
	public List<PlanDetailVO> readAllPlanDetail(int planID) {
		return planDetailDAO.selectAllByPlanID(planID);
	}
	

}
