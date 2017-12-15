package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantVO;
import com.tripster.persistence.RestaurantDAO;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Inject 
	private RestaurantDAO dao;
	
	//맛집 상세 정보 조회
	@Transactional
	@Override
	public RestaurantVO getRestaurantDetail(Integer restaurantID) throws Exception {
		dao.updateRestaurantViewCnt(restaurantID);
		return dao.read(restaurantID);
	}
	
	//맛집 리스트 조회
	@Override
	public List<RestaurantVO> getRestaurantList(Criteria cri) throws Exception {
		return dao.getRestaurantList(cri);
	}
	
	//총 맛집 정보 개수 조회
	@Override
	public int getTotalRestaurantNum(Criteria cri) throws Exception {
		return dao.getTotalRestaurantNum(cri);
	}
}
