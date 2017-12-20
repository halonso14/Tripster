package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashboardVO;

@Repository
public class DashboardDAOImpl implements DashboardDAO{
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.dashboardMapper";
	
	//
	@Override
	public DashBriefVO getPlanInfo(Integer memberID) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getPlanInfo", memberID);
	}
	
	//맛집 리스트 조회
	/*
	public List<ContentsVO> getRestaurantList(Criteria cri) throws Exception {
		return session.selectList(namespace + ".getRestaurantList", cri);
	};
	*/


}