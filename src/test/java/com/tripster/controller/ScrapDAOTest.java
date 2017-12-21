package com.tripster.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.ScrapVO;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.ScrapDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ScrapDAOTest {


	@Inject
	private ContentsDAO contentsDao;
	@Inject
	private ScrapDAO scrapDao;
	
	private static Logger loger = LoggerFactory.getLogger(ScrapDAOTest.class);
	
//	@Test
//	public void readContentsVO () throws Exception {
//		
//		ContentsVO vo = new ContentsVO();
//		vo = dao.readContents(1);
//		System.out.println(vo.toString());
//	}
	
//	@Test
//	public void scrap() throws Exception{
//		ContentsVO cont = new ContentsVO();
//		ScrapVO vo = new ScrapVO();
//		cont = contentsDao.readContents(1);
//		vo.setCategoryID(cont.getCategoryID());
//		vo.setContentsID(cont.getContentsID());
//		vo.setContentsTitle(cont.getTitle());
//		vo.setContentsPhoto("photo");
//		scrapDao.create(vo);
//	}
	
	@Test
	public void scrapCheck() throws Exception{
		
		// 멤버의 스크랩리스트 조회
		List<ScrapVO> list = scrapDao.listAll(1);
		// 해당 페이지의 컨텐츠id를 받아 스크랩 조회
		for(int i=0;i<list.size();i++) {
			if(2 == list.get(i).getContentsID()) {
				System.out.println("1");
				break;
			}
		}
		
	}

}
