package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.RestaurantVO;
import com.tripster.persistence.RestaurantDAO;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Inject 
	private RestaurantDAO dao;
	
	@Override
	public RestaurantVO read(Integer restaurantID) throws Exception {
		return dao.read(restaurantID);
	}
	
	@Override
	public List<RestaurantVO> showList(int curPage) throws Exception {
		return dao.showList(curPage);
	}
}
