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

	//일정 상세 정보 등록.
	@Override
	public void insertPlanDetail(PlanDetailVO vo)throws Exception {
		session.insert(namespace+".insert",vo);
	}

	//일정 상세 정보 수정.
	@Override
	public void updatePlanDetail(Map<String,Object> map)throws Exception {
		session.update(namespace+".update",map);
	}

	//일정 상세 정보 삭제.
	@Override
	public void deletePlanDetail(int planDetailID)throws Exception {
		session.delete(namespace+".delete", planDetailID);
	}

	//해당 일정 삭제 시, 상세 내용 전체 삭제.
//	@Override
//	public void deleteAllByPlanID(int planID)throws Exception {
//		session.delete(namespace+".deleteAll",planID);
//		
//	}

	//조회.
	@Override
	public List<PlanDetailVO> selectAllByPlanID(int planID)throws Exception {
		return session.selectList(namespace+".selectAll", planID);
	}

	//최근 등록된 일정상세의 id 값 조회
	@Override
	public int selectPlanDetailID() throws Exception {
		return session.selectOne(namespace+".selectPlanDetailID");
	}
	
	
	
}
