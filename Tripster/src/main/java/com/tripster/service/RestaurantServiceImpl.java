package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantVO;
import com.tripster.persistence.RestaurantDAO;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Inject 
	private RestaurantDAO dao;
	
	@Override
	public RestaurantVO getRestaurantDetail(Integer restaurantID) throws Exception {
		return dao.read(restaurantID);
	}
	
	@Override
	public List<RestaurantVO> getRestaurantList(Criteria cri) throws Exception {
		return dao.getRestaurantList(cri);
	}
	
	@Override
	public int getTotalRestaurantNum(Criteria cri) throws Exception {
		return dao.getTotalRestaurantNum(cri);
	}
}
