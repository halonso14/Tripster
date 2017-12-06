package com.tripster.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.ScrapVO;
import com.tripster.persistence.ScrapDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardTest {

	@Inject
	private ScrapDAO dao;
	
	@Test
	public void testCreate() throws Exception {
	
		ScrapVO board = new ScrapVO();
		board.setTitle("제목");
		board.setContent("내용");
		board.setWriter("user01");
		dao.create(board);
	}
	
}
