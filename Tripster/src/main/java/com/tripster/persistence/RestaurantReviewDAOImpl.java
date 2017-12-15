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
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.RestaurantReviewMapper";
	
	@Override
	public void write(RestaurantReviewVO vo) throws Exception {
		session.insert(namespace + ".write", vo);
	}

	@Override
	public void modify(RestaurantReviewVO vo) throws Exception {
		session.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(Integer reviewID) throws Exception {
		session.delete(namespace + ".delete", reviewID);
	}
	
	//맛집 리뷰 리스트 조회
	@Override
	public List<RestaurantReviewVO> getRestaurantReviewList(Integer restaurantID, Criteria cri) throws Exception {
		//RestaurantID, Criteria 객체를 전달할 Map 객체 생성 
		Map<String, Object> paramMap = new HashMap<>();
		
		//Map 객체에 RestaurantID, Criteria 객체 저장
		paramMap.put("restaurantID", restaurantID);
		paramMap.put("cri", cri);
		//쿼리 결과 반환
		return session.selectList(namespace + ".getRestaurantReviewList", paramMap);
	}
	
	//맛집 총 리뷰 개수 조회
	@Override
	public int getTotalRestaurantReviewNum(Integer restaurantID) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getTotalRestaurantReviewNum", restaurantID);
	}
}