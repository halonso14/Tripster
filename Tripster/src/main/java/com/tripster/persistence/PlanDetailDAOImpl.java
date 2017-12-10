package com.tripster.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.PlanDetailVO;

@Repository
public class PlanDetailDAOImpl implements PlanDetailDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.tripster.mapper.planDetailMapper";

	@Override
	public void insertPlanDetail(PlanDetailVO vo) {
		session.insert(namespace+".insert",vo);
		
	}

	@Override
	public void updatePlanDetail(PlanDetailVO vo) {
		session.update(namespace+".update",vo);
		
	}

	@Override
	public void deletePlanDetail(int planDetailID) {
		session.delete(namespace+".delete", planDetailID);
		
	}

	@Override
	public void deleteAllByPlanID(int planID) {
		session.delete(namespace+".deleteAll",planID);
		
	}

	@Override
	public List<PlanDetailVO> selectAllByPlanID(int planID) {
		return session.selectList(namespace+".selectAll", planID);
	}
	
}
