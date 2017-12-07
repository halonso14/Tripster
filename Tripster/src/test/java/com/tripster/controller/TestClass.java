package com.tripster.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.ContentsVO;
import com.tripster.persistence.ContentsDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class TestClass {

	@Inject
	private ContentsDAO dao;
	
	private static Logger loger = LoggerFactory.getLogger(TestClass.class);
	
//	@Test
//	public void ScrapCreateTest() throws Exception {
//	
//		ScrapVO scrap = new ScrapVO();
//		scrap.setCodeID(1);
//		scrap.setContentsID(1);
//		scrap.setContentsPhoto("str");
//		scrap.setContentsTitle("t");
//		scrap.setMemberID(3);
//		scrap.setScrapID(1);
//		dao.create(scrap);
//		
//	}
	
	@Test
	public void ContentsReadTest() throws Exception {
	
		ContentsVO vo = new ContentsVO();
		vo = dao.read(2);
		loger.info(vo.toString());
		
	}
	
	@Test
	public void ScrapTest() throws Exception {
	
		ContentsVO vo = new ContentsVO();
		
		
	}
	
}
