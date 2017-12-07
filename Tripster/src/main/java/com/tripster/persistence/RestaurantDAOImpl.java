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
		session.read(namespace + ".read", restaurantID);
	}
	
	@Override
	public List<RestaurantVO> showList(int curPage) {
		session.showList(namespace + ".showList");
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {

		return 0;
	}
}
