package com.tripster.controller;

import java.util.*;

import javax.inject.Inject;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripster.domain.SearchPageMaker;
import com.tripster.domain.EsContentsVO;
import com.tripster.domain.EsMemberVO;
import com.tripster.domain.EsPlanVO;
import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;
import com.tripster.service.EsSearchService;

@Controller
public class SearchController {
	
	private static final Logger logger = LogManager.getLogger(SearchController.class);
	
	@Inject
	private EsSearchService esSearchService;
	
	// 통합검색 결과리스트 요청
	@RequestMapping(value="/search*", method = RequestMethod.GET)
	public void search(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		System.out.println("search cri="+cri.toString());
		
		
		// 전체 페이지 불러오기
		EsSearchResult results = esSearchService.getTotalSearchList(cri);
		// 10개 목록만 불러오기
		EsSearchResult result = esSearchService.pageList(cri);
		
		model.addAttribute("contentsList",results.getContentsList());
		model.addAttribute("planList",results.getPlanList());
		model.addAttribute("memberList",results.getMemberList());
		model.addAttribute("getNum",esSearchService.getTotalSearchNum(cri));
		model.addAttribute("keyword",cri.getKeyword());
		
		// model에 EsRepository의 검색결과 건수를 담아서 SearchPageMaker로 보낸다.
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Long.parseLong(esSearchService.getTotalSearchNum(cri).get("totalNum")));

		model.addAttribute("pageMaker",pageMaker);
		
	}
	
}
