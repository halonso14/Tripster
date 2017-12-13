package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantReviewVO;
import com.tripster.persistence.RestaurantDAO;
import com.tripster.persistence.RestaurantReviewDAO;

@Service
public class RestaurantReviewServiceImpl implements RestaurantReviewService {
	
	@Inject 
	private RestaurantReviewDAO dao;
	
	@Inject 
	private RestaurantDAO restaurantDao;

	@Transactional
	@Override
	public void writeReview(RestaurantReviewVO vo) throws Exception {
		dao.write(vo);
		restaurantDao.updateRestaurantReviewCnt(vo.getRestaurantID(), 1);
	}

	@Override
	public void modifyReview(RestaurantReviewVO vo) throws Exception {
		dao.modify(vo);
	}

	@Transactional
	@Override
	public void deleteReview(Integer restaurantReviewID) throws Exception {
		Integer restaurantID = dao.getRestaurantID(restaurantReviewID);
		dao.delete(restaurantReviewID);
		restaurantDao.updateRestaurantReviewCnt(restaurantID, -1);
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
