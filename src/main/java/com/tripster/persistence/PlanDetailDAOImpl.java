package com.tripster.persistence;

import java.util.List;
import java.util.Map;

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
	public void insertPlanDetail(PlanDetailVO vo)throws Exception {
		session.insert(namespace+".insert",vo);
		
	}

	@Override
	public void updatePlanDetail(Map<String,Object> map)throws Exception {
		session.update(namespace+".update",map);
		
	}

	@Override
	public void deletePlanDetail(int planDetailID)throws Exception {
		session.delete(namespace+".delete", planDetailID);
		
	}

	@Override
	public void deleteAllByPlanID(int planID)throws Exception {
		session.delete(namespace+".deleteAll",planID);
		
	}

	@Override
	public List<PlanDetailVO> selectAllByPlanID(int planID)throws Exception {
		return session.selectList(namespace+".selectAll", planID);
	}

	@Override
	public int selectPlanDetailID() throws Exception {
		return session.selectOne(namespace+".selectPlanDetailID");
	}
	
	
	
}
