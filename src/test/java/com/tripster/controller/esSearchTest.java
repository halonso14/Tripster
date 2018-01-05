package com.tripster.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.EsContentsVO;
import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;
import com.tripster.service.EsSearchService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class esSearchTest {
	
	@Inject
	EsSearchService service;
	
	@Test
	public void contentsListPageTest() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("언더그라운드");
		
		EsSearchResult result = service.getTotalSearchList(cri);
		
		List<EsContentsVO> list = new ArrayList<>();
		for(int i=0;i<10;i++) {
			list.add(result.getContentsList().get(i));
		}
		
	}

}
