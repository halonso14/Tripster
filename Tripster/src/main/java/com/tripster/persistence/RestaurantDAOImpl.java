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
	//DB 조회용 쿼리 연결
	private static String namespace = "com.tripster.mapper.RestaurantMapper";
	
	//맛집 상세 정보 조회
	@Override
	public RestaurantVO read(Integer restaurantID) throws Exception {
		return session.selectOne(namespace + ".read", restaurantID);
	}
	
	//맛집 리스트 조회
	@Override
	public List<RestaurantVO> getRestaurantList(Criteria cri) throws Exception {
		return session.selectList(namespace + ".getRestaurantList", cri);
	}
	
	//총 맛집 정보 개수 조회
	@Override
	public int getTotalRestaurantNum(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".getTotalRestaurantNum", cri);
	}
}
