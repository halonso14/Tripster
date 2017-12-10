package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantReviewVO;
import com.tripster.persistence.RestaurantReviewDAO;

@Service
public class RestaurantReviewServiceImpl implements RestaurantReviewService {
	
	@Inject 
	private RestaurantReviewDAO dao;

	@Override
	public void writeReview(RestaurantReviewVO vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public void modifyReview(RestaurantReviewVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void deleteReview(Integer reviewID) throws Exception {
		dao.delete(reviewID);
	}

	@Override
	public List<RestaurantReviewVO> getRestaurantReviewList(Integer restaurantID, Criteria cri) throws Exception {
		return dao.getRestaurantReviewList(restaurantID, cri);
	}

	@Override
	public int getTotalRestaurantReviewNum(Integer restaurantID) throws Exception {
		return dao.getTotalRestaurantReviewNum(restaurantID);
	}
	
	
}
