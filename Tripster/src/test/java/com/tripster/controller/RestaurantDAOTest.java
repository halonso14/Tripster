package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantVO;
import com.tripster.persistence.RestaurantDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class RestaurantDAOTest {

	@Inject
	private RestaurantDAO dao;
	Criteria cri = new Criteria();
	
	@Test
	public void testRead() throws Exception {
		System.out.println(dao.read(1).toString());
	}
	
	@Test
	public void testGetRestaurantList() throws Exception {
		cri.setCurPage(1);
		cri.setContentsPerPage(5);
		List<RestaurantVO> list = dao.getRestaurantList(cri);
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
	}
	
	@Test
	public void testGetTotalRestaurantNum() throws Exception {
		System.out.println(dao.getTotalRestaurantNum(cri));
	}
}
