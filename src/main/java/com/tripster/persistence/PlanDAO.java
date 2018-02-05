package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.EsPlanVO;
import com.tripster.domain.PlanVO;

public interface PlanDAO {
	//일정 등록.
	public void insertPlan(PlanVO vo)throws Exception;
	
	//일정 수정.
	public void updatePlan(PlanVO planVO)throws Exception;
	
	//일정 삭제.
	public void deletePlan(int planID)throws Exception;
	
	//일정 조회.
	public PlanVO selectPlan(int planID)throws Exception;
	
	//가장 최근에 저장된 일정 ID값 조회.
	public int selectLastPlanID()throws Exception;
	
	//나의 일정 조회
	public List<PlanVO> selectMyPlan(int memberID, Criteria cri) throws Exception;
	
	//memberName조회
	public String selectMemberName(int memberID)throws Exception;
	
	//endChk 수정
	public void updateEndChk(int planID, int planEndChk)throws Exception;
	
	//plan thumbnail로 쓰일 사진주소가져오기 (es용)
	public String selectthumbnail(int planID)throws Exception;
	
	// 좋아요 카운트 리스트
	public List<EsPlanVO> getLikeCntList() throws Exception;
}
