package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashCountryVO;
import com.tripster.domain.DashDetailVO;
import com.tripster.domain.DashLikeVO;
import com.tripster.domain.DashboardVO;
import com.tripster.domain.PlanVO;
import com.tripster.domain.RcmPlanVO;

@Repository
public class RecommandDAOImpl implements RecommandDAO{
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.recommandMapper";
	

	//대쉬보트 통계에 뿌려줄 데이터2. <일정 별 좋아요 수, >
	@Override
	public List<PlanVO> getPlanList(String countryISO2) throws Exception {
		//쿼리 결과 반환
		return session.selectList(namespace + ".getPlanList", countryISO2);
	}


	


}