package com.tripster.controller;

import javax.inject.Inject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;
import com.tripster.domain.SearchPageMaker;
import com.tripster.service.EsSearchService;

@Controller
@RequestMapping("/search/*")
public class SearchController {
	
	private static final Logger logger = LogManager.getLogger(SearchController.class);
	
	@Inject
	private EsSearchService esSearchService;
	
	
	// 통합검색 결과리스트 요청
	@RequestMapping(value="/result", method = RequestMethod.GET)
	public String search(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// model에 통합 검색결과 담기 
		model.addAttribute("totalList",esSearchService.getTotalSearchList(cri));
		return "/search/result";
	}
	
	
	// 컨텐츠 검색결과 더보기 요청
	@RequestMapping(value="/contents", method = RequestMethod.GET)
	public String searcContents(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// 컨텐츠 검색 결과리스트 변수 선언   
		EsSearchResult searcContents = esSearchService.getContentsSearchList(cri);
		// 컨텐츠 리스트 페이징 처리 변수 선언  
		SearchPageMaker pageMaker = new SearchPageMaker();
		
		// pagemaker에 검색어 담기 
		pageMaker.setCri(cri);
		// pagemaker에 컨텐츠 검색건수 담기 
		pageMaker.setTotalCount(searcContents.getContestsCnt());
		
		// model에 검색 결과리스트 담기  
		model.addAttribute("contentsList",searcContents);
		// model에 pagemaker 담기 
		model.addAttribute("pageMaker",pageMaker);

		return "/search/contents";
	}
	
	
	// 일정 검색결과 더보기 요청
	@RequestMapping(value="/plan", method = RequestMethod.GET)
	public String searcPlan(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// 일정 검색 결과리스트 변수 선언   
		EsSearchResult searcPlan = esSearchService.getContentsSearchList(cri);
		// 일정 리스트 페이징 처리 변수 선언  
		SearchPageMaker pageMaker = new SearchPageMaker();
		
		// pagemaker에 검색어 담기 
		pageMaker.setCri(cri);
		// pagemaker에 컨텐츠 검색건수 담기 
		pageMaker.setTotalCount(searcPlan.getPlanCnt());
		
		// model에 검색 결과리스트 담기  
		model.addAttribute("planList",searcPlan);
		// model에 pagemaker 담기 
		model.addAttribute("pageMaker",pageMaker);

		return "/search/plan";
	}

	
	// 회원 검색결과 더보기 요청
	@RequestMapping(value="/member", method = RequestMethod.GET)
	public String searcMember(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// 일정 검색 결과리스트 변수 선언   
		EsSearchResult searcMember= esSearchService.getMemberSearchList(cri);
		// 일정 리스트 페이징 처리 변수 선언  
		SearchPageMaker pageMaker = new SearchPageMaker();
		
		// pagemaker에 검색어 담기 
		pageMaker.setCri(cri);
		// pagemaker에 컨텐츠 검색건수 담기 
		pageMaker.setTotalCount(searcMember.getMemberCnt());
		
		// model에 검색 결과리스트 담기  
		model.addAttribute("memberList",searcMember);
		// model에 pagemaker 담기 
		model.addAttribute("pageMaker",pageMaker);

		return "/search/member";
	}
}