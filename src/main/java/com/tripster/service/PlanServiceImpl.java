package com.tripster.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.PlanDetailVO;
import com.tripster.domain.PlanVO;
import com.tripster.persistence.PlanDAO;
import com.tripster.persistence.PlanDetailDAO;

@Service
public class PlanServiceImpl implements PlanService{

	@Inject
	private  PlanDAO planDAO;
	@Inject
	private PlanDetailDAO planDetailDAO;
	
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
	@Transactional
	@Override
	public PlanVO readPlan(int planID) throws Exception {
		//planID로 등록된 plan 조회.
		PlanVO plan = planDAO.selectPlan(planID);
		//planID로 등록된 planDetail 전체 조회
		List<PlanDetailVO> planDetailList = planDetailDAO.selectAllByPlanID(planID);
		//조회한 planDetail 객체를 planVO 객체에 저장 후 리턴.
		plan.setPlanDetailVO(planDetailList);
		
		return plan;
	}

	//plan만 조회
	
	@Override
	public PlanVO readOnlyPlan(int planID) throws Exception {
		return planDAO.selectPlan(planID);
	}

	
	//최근 저장된 planID 값 읽기.
	@Override
	public int readPlanID() throws Exception {
		return planDAO.selectLastPlanID();
	}
	

	//나의 플랜 조회
	@Override
	public List<PlanVO> myPlan(int memberID) throws Exception {
		//member ID로 등록된 plan 전체 조회.
		List<PlanVO> list = planDAO.selectMyPlan(memberID);
		
		//plan에 해당 하는 planDetail 전체 조회 후, PlanVO객체에 담아줌.
		for( int i=0; i<list.size(); i++) {
			int planID = list.get(i).getPlanID();
			
			list.get(i).setPlanDetailVO(planDetailDAO.selectAllByPlanID(planID));
		}
		
		return list;

	}

	//memberName조회
	@Override
	public String memberName(int memberID) throws Exception {
		return planDAO.selectMemberName(memberID);
	}
	
	
}
