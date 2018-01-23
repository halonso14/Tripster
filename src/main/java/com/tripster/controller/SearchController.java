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

import com.tripster.domain.SearchCriteria;
import com.tripster.domain.SearchPageMaker;
import com.tripster.elasticsearch.EsSearchScroll;
import com.tripster.service.EsSearchService;

@Controller
@RequestMapping("/search/*")
public class SearchController {
	
	private static final Logger logger = LogManager.getLogger(SearchController.class);
	
	@Inject
	private EsSearchService esSearchService;
	@Inject
	private EsSearchScroll esSearchScroll;
	
	// 통합검색 결과리스트 요청
	@RequestMapping(value="result", method = RequestMethod.GET)
	public String search(@RequestParam(value="tab", required=false) String tab, 
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// model에 컨텐츠/일정/회원 검색 결과 리스트 담기 
		model.addAttribute("contentsList",esSearchService.getTotalSearchList(cri).contentsList);
		model.addAttribute("planList",esSearchService.getTotalSearchList(cri).planList);
		model.addAttribute("memberList",esSearchService.getTotalSearchList(cri).memberList);
		model.addAttribute("getNum",esSearchService.getTotalSearchNum(cri));
		
		// 컨텐츠/일정/회원 탭마다 pagemaker 별도로 처리필요   
		SearchPageMaker contentsPageMaker = new SearchPageMaker();
		SearchPageMaker planPageMaker = new SearchPageMaker();
		SearchPageMaker memberPageMaker = new SearchPageMaker();
		
		contentsPageMaker.setCri(cri);
		contentsPageMaker.setTotalCount(Integer.parseInt(esSearchService.getTotalSearchNum(cri).get("contentsNum")));
		planPageMaker.setCri(cri);
		planPageMaker.setTotalCount(Integer.parseInt(esSearchService.getTotalSearchNum(cri).get("planNum")));
		memberPageMaker.setCri(cri);	
		memberPageMaker.setTotalCount(Integer.parseInt(esSearchService.getTotalSearchNum(cri).get("memberNum")));
		
		model.addAttribute("contentsPageMaker",contentsPageMaker);
		model.addAttribute("planPageMaker",planPageMaker);
		model.addAttribute("memberPageMaker",memberPageMaker);
		
		// 페이지 이동시 컨텐츠/일정/회원 탭 위치 알려줄 파라미터값 model에 담기 
		model.addAttribute("tab",tab);
		
		return "result";
	}
	
	@RequestMapping(value="contents", method = RequestMethod.GET)
	public String scrollContents(@RequestParam(value="tab", required=false) String tab, 
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		String scrollID="" ; 
		model.addAttribute("contentsList",esSearchScroll.getContentsList(cri,scrollID));
		
		return "contents";	
	}
}