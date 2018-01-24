package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.EsContentsVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.persistence.EsContentsDAO;
import com.tripster.service.EsSearchService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class esSearchTest {
	
	@Inject
	EsSearchService service;
	@Inject
	EsContentsDAO dao;
	
//	@Test
//	public void contentsListPageTest() throws Exception{
//		
//		SearchCriteria cri = new SearchCriteria();
//		cri.setKeyword("파리");
//		cri.setPage(2);
//		List<EsContentsVO> result = service.contentsList(cri);
//		
//		System.out.println(result.toString());
//		System.out.println(result.size());
//		
//	}
	
//	@Test
//	public void pageTest() throws Exception{
//		
//		SearchCriteria cri = new SearchCriteria();
//		cri.setKeyword("1");
//		
//		List<EsContentsVO> list = dao.getContentsList(cri);
//		
////		System.out.println(list.get(0).getContents_keyword());
//		System.out.println(list.size());
//		
//	}

}