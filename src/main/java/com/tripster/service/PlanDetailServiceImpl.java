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
	
	//일정 상세 정보 등록.
	@Override
	public void registerPlanDetail(PlanDetailVO vo)throws Exception {
		System.out.println("service당!!!");
		planDetailDAO.insertPlanDetail(vo);
		
	}

	//일정 상세 정보 수정.
	@Override
	public void modifyPlanDetail(Map<String,Object> map)throws Exception {
		planDetailDAO.updatePlanDetail(map);
		
	}

	//일정 상세 정보 삭제.
	@Override
	public void deletePlanDetail(int planDetailID)throws Exception {
		planDetailDAO.deletePlanDetail(planDetailID);
		
	}

//	//일정 삭제 시, 모든 일정 상세 정보 삭제.
//	@Override
//	public void deleteAllPlanDetail(int planID)throws Exception {
//		planDetailDAO.deleteAllByPlanID(planID);
//	}

	//모든 일정 조회
	@Override
	public List<PlanDetailVO> readAllPlanDetail(int planID)throws Exception {
		return planDetailDAO.selectAllByPlanID(planID);
	}

	//최근 등록된 일정 상세의 id 값 조회
	@Override
	public int readPlanDetailID() throws Exception {
		return planDetailDAO.selectPlanDetailID();
	}
	
	

}
