package com.tripster.controller;

import javax.inject.Inject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.domain.SearchPageMaker;
import com.tripster.service.EsSearchService;

@Controller
@RequestMapping("/search/*")
public class SearchController {
	
	private static final Logger logger = LogManager.getLogger(SearchController.class);
	
	@Inject
	private EsSearchService esSearchService;
	
	
	// 통합 검색결과 요청
	@RequestMapping(value="result", method = RequestMethod.GET)
	public String search(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// model에 통합 검색결과 담기 
		model.addAttribute("totalList",esSearchService.getTotalSearchList(cri));
		
		return "/search/result";
	}
	
	// 컨텐츠 검색결과 요청
	@RequestMapping(value="contents", method=RequestMethod.GET)
	public String searchContents(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// model에 검색 결과리스트 담기   
		EsSearchResultVO searchContents = esSearchService.getContentsSearchList(cri);
		model.addAttribute("contentsList",searchContents);

		// model에 pagemaker 담기  
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchContents.getContentsCnt() != null) { pageMaker.setTotalCount(searchContents.getContentsCnt()); }
		model.addAttribute("pageMaker",pageMaker);

		return "/search/contents";
	}
	
	// 일정 검색결과 요청
	@RequestMapping(value="plan", method = RequestMethod.GET)
	public String searchPlan(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// model에 검색 결과리스트 담기   
		EsSearchResultVO searchPlan = esSearchService.getPlanSearchList(cri);
		model.addAttribute("planList",searchPlan);	
		
		// model에 pagemaker 담기  
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchPlan.getPlanCnt() != null) { pageMaker.setTotalCount(searchPlan.getPlanCnt()); }
		model.addAttribute("pageMaker",pageMaker);

		return "/search/plan";
	}
	
	// 회원 검색결과 요청
	@RequestMapping(value="member", method = RequestMethod.GET)
	public String searchMember(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		// model에 검색 결과리스트 담기   
		EsSearchResultVO searchMember= esSearchService.getMemberSearchList(cri);
		model.addAttribute("memberList",searchMember);
		
		// model에 pagemaker 담기 		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchMember.getMemberCnt() != null) { pageMaker.setTotalCount(searchMember.getMemberCnt()); }
		model.addAttribute("pageMaker",pageMaker);

		return "/search/member";
	}

	// 통합 검색결과 탭 요청
	@RequestMapping(value="totalPost", method = RequestMethod.POST)
	public ModelAndView searchPost(SearchCriteria searchCriteria) throws Exception{
		
		ModelAndView view = new ModelAndView();
		
		// model&view에 통합 검색결과 담기 
		EsSearchResultVO totalList = esSearchService.getTotalSearchList(searchCriteria);
		view.addObject("totalList", totalList);
		
		// model&view에 pagemaker 담기 
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(searchCriteria);	
		if(totalList.getTotalCnt() != null) { pageMaker.setTotalCount(totalList.getTotalCnt()); }
		view.addObject("pageMaker", pageMaker);
		
		// model&view에 post로 넘어온값 다시 담기 
		view.addObject("searchCriteria", searchCriteria);
		
		view.setViewName("/search/result");	
		return view;
	}

	// 컨텐츠 검색결과 탭 요청
	@RequestMapping(value="contentsPost", method = RequestMethod.POST)
	public ModelAndView searchContentsPost(SearchCriteria searchCriteria) throws Exception{
		
		ModelAndView view = new ModelAndView();
		
		// model&view에 컨텐츠 검색결과 담기 
		EsSearchResultVO contentsList = esSearchService.getContentsSearchList(searchCriteria);
		view.addObject("contentsList", contentsList);
		
		// model&view에 pagemaker 담기 
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(searchCriteria);	
		if(contentsList.getContentsCnt() != null) { pageMaker.setTotalCount(contentsList.getContentsCnt()); }
		view.addObject("pageMaker", pageMaker);
		
		// model&view에 post로 넘어온값 다시 담기 
		view.addObject("searchCriteria", searchCriteria);
		
		view.setViewName("/search/contents");	
		return view;
	}	

	// 일정 검색결과 탭 요청
	@RequestMapping(value="planPost", method = RequestMethod.POST)
	public ModelAndView searcPlanPost(SearchCriteria searchCriteria) throws Exception{
		
		ModelAndView view = new ModelAndView();
		
		// model&view에 일정 검색결과 담기 
		EsSearchResultVO planList = esSearchService.getPlanSearchList(searchCriteria);
		view.addObject("planList", planList);
		
		// model&view에 pagemaker 담기 
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(searchCriteria);	
		if(planList.getPlanCnt() != null) { pageMaker.setTotalCount(planList.getPlanCnt()); }
		view.addObject("pageMaker", pageMaker);
		
		// model&view에 post로 넘어온값 다시 담기 
		view.addObject("searchCriteria", searchCriteria);
		
		view.setViewName("/search/plan");	
		return view;
	}	
	
	// 회원 검색결과 탭 요청
	@RequestMapping(value="memberPost", method = RequestMethod.POST)
	public ModelAndView searcMemberPost(SearchCriteria searchCriteria) throws Exception{
		
		ModelAndView view = new ModelAndView();
		
		// model&view에 일정 검색결과 담기 
		EsSearchResultVO memberList = esSearchService.getMemberSearchList(searchCriteria);
		view.addObject("memberList", memberList);
		
		// model&view에 pagemaker 담기 
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(searchCriteria);	
		if(memberList.getMemberCnt() != null) { pageMaker.setTotalCount(memberList.getMemberCnt()); }
		view.addObject("pageMaker", pageMaker);
		
		// model&view에 post로 넘어온값 다시 담기 
		view.addObject("searchCriteria", searchCriteria);
		
		view.setView(new RedirectView("/search/member?keyword="+searchCriteria.getKeyword(),true));	
		return view;
	}		

}