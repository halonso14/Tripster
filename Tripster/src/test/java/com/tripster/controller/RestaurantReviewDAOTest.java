package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantReviewVO;
import com.tripster.persistence.RestaurantReviewDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class RestaurantReviewDAOTest {

	@Inject
	private RestaurantReviewDAO dao;
	
	@Test
	public void testWrite() throws Exception {
		RestaurantReviewVO vo = new RestaurantReviewVO();
		vo.setMemberID(1);
		vo.setRestaurantID(1);
		vo.setRestaurantReview("review test");
		
		dao.write(vo);
	}
	
	@Test
	public void testModify() throws Exception {
		RestaurantReviewVO vo = new RestaurantReviewVO();
		vo.setRestaurantReviewID(6);
		vo.setRestaurantReview("review modify test");
		
		dao.modify(vo);
	}
	
	@Test
	public void testDelete() throws Exception {
		Integer reviewID = 6;
		dao.delete(reviewID);
	}
	
	@Test
	public void testGetTotalRestaurantReviewNum() throws Exception {
		System.out.println(dao.getTotalRestaurantReviewNum(1));
	}
	
	@Test
	public void testGetRestaurantReviewList() throws Exception {
		Criteria cri = new Criteria();
		cri.getStartNum();
		List<RestaurantReviewVO> list = dao.getRestaurantReviewList(1, cri);
		System.out.println(list.get(1).toString());
	}
}