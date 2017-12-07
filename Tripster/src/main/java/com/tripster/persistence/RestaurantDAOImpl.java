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
	public RestaurantVO read(Integer restaurantID) {
		return session.selectOne(namespace + ".read", restaurantID);
	}
	
	@Override
	public List<RestaurantVO> showList(Criteria cri) {
		return session.selectList(namespace + ".showList", cri);
	}
}
