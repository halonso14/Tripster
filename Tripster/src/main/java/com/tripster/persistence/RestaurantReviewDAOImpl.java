package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantReviewVO;

@Repository
public class RestaurantReviewDAOImpl implements RestaurantReviewDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.tripster.mapper.RestaurantReviewMapper";
	
	@Override
	public void write(RestaurantReviewVO vo) throws Exception {
		session.insert(namespace + ".write", vo);
	}

	@Override
	public void modify(RestaurantReviewVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer reviewID) throws Exception {
		session.delete(namespace + ".delete", reviewID);
	}

	@Override
	public List<RestaurantReviewVO> getRestaurantReviewList(Integer restaurantID, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("restaurantID", restaurantID);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".getRestaurantReviewList", paramMap);
	}

	@Override
	public int getTotalRestaurantReviewNum(Integer restaurantID) throws Exception {
		return session.selectOne(namespace + ".getTotalRestaurantReviewNum", restaurantID);
	}
}