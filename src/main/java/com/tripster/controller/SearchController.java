package com.tripster.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.taglibs.standard.extra.spath.Path;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
		
		EsSearchResultVO searchTotal = esSearchService.getTotalSearchList(cri);
		System.out.println(searchTotal.getTotalCnt());
		System.out.println(cri.getTab());
		cri.setTotalCnt(searchTotal.getTotalCnt());
		cri.setContentsCnt(searchTotal.getContentsCnt());
		cri.setPlanCnt(searchTotal.getPlanCnt());
		cri.setMemberCnt(searchTotal.getMemberCnt());
		cri.setTab("total");
		
		// model에 통합 검색결과 담기 
		model.addAttribute("totalList",searchTotal);
		model.addAttribute("cri",cri);	
		
		return "/search/result";
	}
	
	// 통합 검색결과 탭 POST요청
	@RequestMapping(value="result", method = RequestMethod.POST)
	public ModelAndView search(SearchCriteria searchCriteria) throws Exception{
		
		ModelAndView view = new ModelAndView();
		
		// model&view에 담기
		view.addObject("cri", searchCriteria);
		view.addObject("totalList",esSearchService.getTotalSearchList(searchCriteria));
		view.setViewName("/search/result");
		
		return view;
	}	
	
	
	
	// 컨텐츠 검색결과 요청
	@RequestMapping(value="contents", method=RequestMethod.GET)
	public String searchContents(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		EsSearchResultVO searchContents = esSearchService.getContentsSearchList(cri);
		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchContents.getContentsCnt() != null) { pageMaker.setTotalCount(searchContents.getContentsCnt()); }
		
		// model에 검색결과 담기   
		model.addAttribute("contentsList",searchContents);
		model.addAttribute("pageMaker",pageMaker);

		return "/search/resultDetail";
	}
	
	// 컨텐츠 검색결과 탭 POST요청
	@RequestMapping(value="contents", method = RequestMethod.POST)
	public ModelAndView searchContentsPost(SearchCriteria searchCriteria) throws Exception{
		
		ModelAndView view = new ModelAndView();
		
		EsSearchResultVO contentsList = esSearchService.getContentsSearchList(searchCriteria);
		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(searchCriteria);	
		if(contentsList.getContentsCnt() != null) { pageMaker.setTotalCount(contentsList.getContentsCnt()); }
		
		// model&view에 담기 
		view.addObject("cri", searchCriteria);
		view.addObject("contentsList", contentsList);
		view.addObject("pageMaker", pageMaker);
		view.setViewName("/search/resultDetail");		
		
		return view;
	}		
	
	
	
	// 일정 검색결과 요청
	@RequestMapping(value="plan", method = RequestMethod.GET)
	public String searchPlan(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		  
		EsSearchResultVO searchPlan = esSearchService.getPlanSearchList(cri);
		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchPlan.getPlanCnt() != null) { pageMaker.setTotalCount(searchPlan.getPlanCnt()); }

		model.addAttribute("planList",searchPlan);
		model.addAttribute("pageMaker",pageMaker);

		return "/search/resultDetail";
	}
	
	// 일정 검색결과 탭 POST요청
	@RequestMapping(value="plan", method = RequestMethod.POST)
	public ModelAndView searcPlanPost(SearchCriteria searchCriteria) throws Exception{
		
		ModelAndView view = new ModelAndView();

		EsSearchResultVO planList = esSearchService.getPlanSearchList(searchCriteria);

		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(searchCriteria);	
		if(planList.getPlanCnt() != null) { pageMaker.setTotalCount(planList.getPlanCnt()); }
		
		view.addObject("cri", searchCriteria);
		view.addObject("planList", planList);
		view.addObject("pageMaker", pageMaker);
		view.setViewName("/search/resultDetail");	
		
		return view;
	}	
	
	
	
	// 회원 검색결과 요청
	@RequestMapping(value="member", method = RequestMethod.GET)
	public String searchMember(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		EsSearchResultVO searchMember= esSearchService.getMemberSearchList(cri);
	
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchMember.getMemberCnt() != null) { pageMaker.setTotalCount(searchMember.getMemberCnt()); }
		
		model.addAttribute("memberList",searchMember);
		model.addAttribute("pageMaker",pageMaker);

		return "/search/resultDetail";
	}
	
	// 회원 검색결과 탭 POST요청
	@RequestMapping(value="member", method = RequestMethod.POST)
	public ModelAndView searcMemberPost(SearchCriteria searchCriteria) throws Exception{
		
		ModelAndView view = new ModelAndView();
		
		EsSearchResultVO memberList = esSearchService.getMemberSearchList(searchCriteria);
		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(searchCriteria);	
		if(memberList.getMemberCnt() != null) { pageMaker.setTotalCount(memberList.getMemberCnt()); }		
		
		view.addObject("cri", searchCriteria);
		view.addObject("memberList", memberList);
		view.addObject("pageMaker", pageMaker);	
		view.setViewName("/search/resultDetail");
		
		return view;
	}		

}