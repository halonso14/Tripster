package com.tripster.service;

import java.util.List;

import com.tripster.domain.RestaurantVO;

public interface RestaurantService {
	
	public RestaurantVO read(Integer restaurantID) throws Exception;
	
	public List<RestaurantVO> showList(int curPage) throws Exception;
}
