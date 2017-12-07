package com.tripster.service;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantVO;

public interface RestaurantService {
	
	public RestaurantVO readRestaurantDetail(Integer restaurantID) throws Exception;
	
	public List<RestaurantVO> getRestaurantList(Criteria cri) throws Exception;
	
	public int getTotalRestaurantNum(Criteria cri) throws Exception;
}
