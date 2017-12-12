package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.PlanDetailVO;

public interface PlanDetailDAO {
	//일정 상세 정보 등록.
	public void insertPlanDetail(PlanDetailVO vo);
	
	//일정 상세 정보 수정.
	public void updatePlanDetail(PlanDetailVO vo);
	
	//일정 상세 정보 삭제.
	public void deletePlanDetail(int planDetailID);
	
	//해당 일정 삭제 시, 상세 내용 전체 삭제.
	public void deleteAllByPlanID(int planID);
	
	//조회.
	public List<PlanDetailVO> selectAllByPlanID(int planID);
}
