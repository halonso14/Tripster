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
	@RequestMapping(value="result", method = RequestMethod.GET)
	public String search(@ModelAttribute("cri") SearchCriteria cri
					  	,@ModelAttribute("go")String go, Model model) throws Exception{
		
		model.addAttribute("contentsList",esSearchService.contentsList(cri));
		model.addAttribute("planList",esSearchService.planList(cri));
		model.addAttribute("memberList",esSearchService.memberList(cri));
		model.addAttribute("getNum",esSearchService.getTotalSearchNum(cri));
		
		// model에 EsRepository의 검색결과 건수를 담아서 SearchPageMaker로 보낸다.
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);

		model.addAttribute("pageMaker",pageMaker);
		
		if(go.equals("contents")) {
			pageMaker.setTotalCount(Long.parseLong(esSearchService.getTotalSearchNum(cri).get("contentsNum")));
			return "search/contentsResult";
		}
		else if(go.equals("member")) {
			pageMaker.setTotalCount(Long.parseLong(esSearchService.getTotalSearchNum(cri).get("memberNum")));
			return "search/memberResult";
		}
		else if(go.equals("plan")) {
			pageMaker.setTotalCount(Long.parseLong(esSearchService.getTotalSearchNum(cri).get("planNum")));
			return "search/planResult";
		}
		else return "search/result";
		
	}
	
	
}