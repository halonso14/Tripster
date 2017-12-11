package com.tripster.persistence;

import java.util.List;
import java.util.Map;

import com.tripster.domain.PlanDetailVO;

public interface PlanDetailDAO {
	//일정 상세 정보 등록.
	public void insertPlanDetail(PlanDetailVO vo)throws Exception;
	
	//일정 상세 정보 수정.
	public void updatePlanDetail(Map<String,Object> map)throws Exception;
	
	//일정 상세 정보 삭제.
	public void deletePlanDetail(int planDetailID)throws Exception;
	
	//해당 일정 삭제 시, 상세 내용 전체 삭제.
	public void deleteAllByPlanID(int planID)throws Exception;
	
	//조회.
	public List<PlanDetailVO> selectAllByPlanID(int planID)throws Exception;
	
	//최근 등록된 일정상세의 id 값 조회
	public int selectPlanDetailID()throws Exception;
}
