package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantReviewVO;
import com.tripster.persistence.RestaurantDAO;
import com.tripster.persistence.RestaurantReviewDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class RestaurantReviewDAOTest {
	
	@Inject
	private RestaurantDAO dao;
	@Inject
	private RestaurantReviewDAO reviewDao;
	
	@Test
	public void testWrite() throws Exception {
		RestaurantReviewVO vo = new RestaurantReviewVO();
		vo.setMemberID(1);
		vo.setRestaurantID(1);
		vo.setRestaurantReview("review test");
		Criteria cri = new Criteria();
		
		reviewDao.write(vo);
		dao.updateRestaurantReviewCnt(vo.getRestaurantID(), 1);
		System.out.println(reviewDao.getRestaurantReviewList(1, cri));
	}
	
	@Test
	public void testModify() throws Exception {
		RestaurantReviewVO vo = new RestaurantReviewVO();
		Criteria cri = new Criteria();
		vo.setRestaurantReviewID(2);
		vo.setRestaurantReview("review modify test");
		
		reviewDao.modify(vo);
		System.out.println(reviewDao.getRestaurantReviewList(1, cri));
	}
	
	@Test
	public void testDelete() throws Exception {
		Integer restaurantID = 1;
		Integer reviewID = 2;
		reviewDao.delete(reviewID);
		dao.updateRestaurantReviewCnt(restaurantID, -1);
	}
	
	@Test
	public void testGetTotalRestaurantReviewNum() throws Exception {
		System.out.println(reviewDao.getTotalRestaurantReviewNum(1));
	}
	
	@Test
	public void testGetRestaurantReviewList() throws Exception {
		Criteria cri = new Criteria();
		cri.getStartNum();
		List<RestaurantReviewVO> list = reviewDao.getRestaurantReviewList(1, cri);
		System.out.println(list.get(1).toString());
	}
	
	@Test
	public void testGetRestaurantID() throws Exception {
		System.out.println(reviewDao.getRestaurantID(2));
	}
}