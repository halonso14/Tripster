package com.tripster.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantVO;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.tripster.mapper.RestaurantMapper";
	
	@Override
	public RestaurantVO read(Integer restaurantID) throws Exception {
		return session.selectOne(namespace + ".read", restaurantID);
	}
	
	@Override
	public List<RestaurantVO> getRestaurantList(Criteria cri) throws Exception {
		return session.selectList(namespace + ".showList", cri);
	}
	
	@Override
	public int getTotalRestaurantNum(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".getTotalRestaurantNum", cri);
	}
}
