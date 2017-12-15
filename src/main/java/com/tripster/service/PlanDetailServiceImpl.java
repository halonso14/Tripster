package com.tripster.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.PlanDetailVO;
import com.tripster.persistence.MemoDAO;
import com.tripster.persistence.PlanDetailDAO;

@Service
public class PlanDetailServiceImpl implements PlanDetailService{

	@Inject
	private PlanDetailDAO planDetailDAO;
	@Inject
	private MemoDAO memoDAO;
	
	@Override
	public void registerPlanDetail(PlanDetailVO vo)throws Exception {
		System.out.println("service당!!!");
		planDetailDAO.insertPlanDetail(vo);
		
	}

	@Override
	public void modifyPlanDetail(Map<String,Object> map)throws Exception {
		planDetailDAO.updatePlanDetail(map);
		
	}

	@Transactional
	@Override
	public void deletePlanDetail(int planDetailID)throws Exception {
		memoDAO.deleteMemo(planDetailID);
		planDetailDAO.deletePlanDetail(planDetailID);
		
	}

	@Override
	public void deleteAllPlanDetail(int planID)throws Exception {
		planDetailDAO.deleteAllByPlanID(planID);
	}

	@Override
	public List<PlanDetailVO> readAllPlanDetail(int planID)throws Exception {
		return planDetailDAO.selectAllByPlanID(planID);
	}

	@Override
	public int readPlanDetailID() throws Exception {
		return planDetailDAO.selectPlanDetailID();
	}
	
	

}
