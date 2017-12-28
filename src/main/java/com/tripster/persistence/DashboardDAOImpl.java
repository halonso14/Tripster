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

@Repository
public class DashboardDAOImpl implements DashboardDAO{
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.dashboardMapper";
	
	//대쉬보트 통계에 뿌려줄 데이터1. <유저ID, 일정갯수, 총여행일수, 평균여행일수, 가장짧은여행일수, 가장긴여행일수>
	@Override
	public DashBriefVO getPlanBriefInfo(Integer memberID) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getPlanBriefInfo", memberID);
	}
	
	//대쉬보트 통계에 뿌려줄 데이터2. <일정 별 좋아요 수, >
	@Override
	public List<DashDetailVO> getPlanDetailInfo(Integer memberID) throws Exception {
		//쿼리 결과 반환
		return session.selectList(namespace + ".getPlanDetailInfo", memberID);
	}

	@Override
	public List<DashLikeVO> getPlanLikeInfo(Integer memberID) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getPlanLikeInfo", memberID);
	}

	@Override
	public List<DashCountryVO> getPlanCountryInfo(Integer memberID) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getPlanCountryInfo", memberID);
	}
	
	


}