package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.EsContentsVO;
import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.EsContentsDAO;
import com.tripster.service.EsSearchService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class esSearchTest {
	
	@Inject
	EsSearchService service;
	@Inject
	EsContentsDAO dao;
	@Inject
	ContentsDAO contentsDAO;
	
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
	
	@Test
	public void test() throws Exception{
		
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("강남");
		EsSearchResultVO searchContents = service.getContentsSearchList(cri);
//		List<EsContentsVO> scrap = contentsDAO.getScrapCntList();
//		System.out.println("1"+searchContents.getContentsList().get(1).getContents_scrap_cnt());
//		
//		for(int j=0;j<searchContents.getContentsList().size();j++) {
//			System.out.println("컨텐츠아이디:"+searchContents.getContentsList().get(j).getContents_id());
//			for(int i=0;i<scrap.size();i++) {
//				System.out.println("스크랩 아이디:"+scrap.get(i).getContents_id());
//				if(searchContents.getContentsList().get(j).getContents_id() == scrap.get(i).getContents_id()) {
//					System.out.println("j:"+j);
//					System.out.println("i"+i);
//					System.out.println("cnt:"+scrap.get(i).getContents_scrap_cnt());
//					searchContents.getContentsList().get(1).setContents_scrap_cnt(scrap.get(i).getContents_scrap_cnt()+1);
//					
//				}
//			}
//		}
//		
//		System.out.println("2"+searchContents.getContentsList().get(1).getContents_scrap_cnt());
		
		
		//System.out.println(searchContents.getContentsList().get(2).getContents_scrap_cnt());
		System.out.println(dao.getContentsList(cri, 10).getContentsList().get(2).getContents_scrap_cnt());
		
	}

}