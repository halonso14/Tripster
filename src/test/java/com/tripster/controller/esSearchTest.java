package com.tripster.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.SearchCriteria;
import com.tripster.domain.SearchPageMaker;
import com.tripster.service.EsSearchService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class esSearchTest {
	
	@Inject
	EsSearchService service;
	
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
	
	@Test
	public void pageTest() throws Exception{
		SearchPageMaker page = new SearchPageMaker();
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("11");
		page.setCri(cri);
		System.out.println(page.toString());
	}

}
