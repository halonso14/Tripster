package com.tripster.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.PlanVO;

@Repository
public class PlanDAOImpl implements PlanDAO{
	
	@Inject
	private SqlSession session;
	
	//mapper namespace
	private static String namespace = "com.tripster.mapper.planMapper";
	
	//plan 등록.
	@Override
	public void insertPlan(PlanVO vo) {
		session.insert(namespace+".create", vo);
	}

	//plan 수정.
	@Override
	public void updatePlan( PlanVO planVO) {
		session.update(namespace+".update", planVO);
		
	}

	//plan 삭제.
	@Override
	public void deletePlan(int planID) {
		session.delete(namespace+".delete",planID);		
	}

	//plan 조회 (by planID)
	@Override
	public PlanVO selectPlan(int planID) {
		return session.selectOne(namespace+".read", planID);
	}
	
	//가장 최근에 등록된 planID값 조회.
	@Override
	public int selectLastPlanID() {
		return session.selectOne(namespace+".selectLastPlanID");
				
	}
	
	
}
