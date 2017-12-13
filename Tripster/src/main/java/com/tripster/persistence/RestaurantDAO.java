package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantVO;

public interface RestaurantDAO {
	//맛집 상세 정보 조회
	public RestaurantVO read(Integer restaurantID) throws Exception;
	
	//맛집 조회수 수정
	public void updateRestaurantViewCnt(Integer restaurantID) throws Exception;
	
	//맛집 리스트 조회
	public List<RestaurantVO> getRestaurantList(Criteria cri) throws Exception;
	
	//총 맛집 정보 개수 조회
	public int getTotalRestaurantNum(Criteria cri) throws Exception;
	
	//맛집 리뷰 개수 수정
	public void updateRestaurantReviewCnt(Integer restaurantID, int amount) throws Exception;
	
	//조회수 + 검색 + @
}
