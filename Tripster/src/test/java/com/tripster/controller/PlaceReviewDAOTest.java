package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceReviewVO;
import com.tripster.persistence.PlaceDAO;
import com.tripster.persistence.PlaceReviewDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class PlaceReviewDAOTest {
	
	@Inject
	private PlaceDAO dao;
	@Inject
	private PlaceReviewDAO reviewDao;
	
	@Test
	public void testWrite() throws Exception {
		PlaceReviewVO vo = new PlaceReviewVO();
		vo.setMemberID(1);
		vo.setPlaceID(1);
		vo.setPlaceReview("review test");
		Criteria cri = new Criteria();
		
		reviewDao.write(vo);
		dao.updatePlaceReviewCnt(vo.getPlaceID(), 1);
		System.out.println(reviewDao.getPlaceReviewList(1, cri));
	}
	
	@Test
	public void testModify() throws Exception {
		PlaceReviewVO vo = new PlaceReviewVO();
		Criteria cri = new Criteria();
		vo.setPlaceReviewID(2);
		vo.setPlaceReview("review modify test");
		
		reviewDao.modify(vo);
		System.out.println(reviewDao.getPlaceReviewList(1, cri));
	}
	
	@Test
	public void testDelete() throws Exception {
		Integer placeID = 1;
		Integer reviewID = 2;
		reviewDao.delete(reviewID);
		dao.updatePlaceReviewCnt(placeID, -1);
	}
	
	@Test
	public void testGetTotalPlaceReviewNum() throws Exception {
		System.out.println(reviewDao.getTotalPlaceReviewNum(1));
	}
	
	@Test
	public void testGetPlaceReviewList() throws Exception {
		Criteria cri = new Criteria();
		cri.getStartNum();
		List<PlaceReviewVO> list = reviewDao.getPlaceReviewList(1, cri);
		System.out.println(list.get(1).toString());
	}
	
	@Test
	public void testGetPlaceID() throws Exception {
		System.out.println(reviewDao.getPlaceID(2));
	}
}