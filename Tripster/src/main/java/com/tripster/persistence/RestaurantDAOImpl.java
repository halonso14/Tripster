package com.tripster.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantVO;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO{
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.RestaurantMapper";
	
	//맛집 상세 정보 조회
	@Override
	public RestaurantVO read(Integer restaurantID) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".read", restaurantID);
	}
	
	//맛집 리스트 조회
	@Override
	public List<RestaurantVO> getRestaurantList(Criteria cri) throws Exception {
		//쿼리 결과 반환
		return session.selectList(namespace + ".getRestaurantList", cri);
	}
	
	//총 맛집 정보 개수 조회
	@Override
	public int getTotalRestaurantNum(Criteria cri) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getTotalRestaurantNum", cri);
	}
}
