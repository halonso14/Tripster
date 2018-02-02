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
import com.tripster.domain.MemberVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.domain.SearchPageMaker;
import com.tripster.service.EsSearchService;
import com.tripster.service.LikeService;
import com.tripster.service.ScrapService;

@Controller
@RequestMapping("/search/*")
public class SearchController {
	
	private static final Logger logger = LogManager.getLogger(SearchController.class);
	
	@Inject
	private EsSearchService esSearchService;
	@Inject
	private ScrapService scrapService;	
	@Inject
	private LikeService likeService;	
	
	
	// 통합 검색결과 요청
	@RequestMapping(value="result", method = RequestMethod.GET)
	public String search(@ModelAttribute("cri") SearchCriteria cri, Model model,HttpSession session) throws Exception{
		
		EsSearchResultVO searchTotal = esSearchService.getTotalSearchList(cri);
		
		SearchCriteria reCri = new SearchCriteria();
		String cnt = Long.toString(searchTotal.getTotalCnt())+'-'+Long.toString(searchTotal.getContentsCnt())+'-'
				+Long.toString(searchTotal.getPlanCnt())+'-'+Long.toString(searchTotal.getMemberCnt());
		reCri.setCnt(cnt);
		reCri.setTab("total");
		reCri.setKeyword(cri.getKeyword());
		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		
		// 세션에 있는 회원정보 받아오기
		MemberVO memberVO = (MemberVO)session.getAttribute("login");
		
		// model에 회원의 스크랩, 좋아요, 팔로우 리스트 담기. 
		if(memberVO != null) {
			model.addAttribute("scrapIdList",scrapService.scrapIdList(memberVO.getMemberID()));
			model.addAttribute("likeIdList",likeService.likeIdList(memberVO.getMemberID()));
			model.addAttribute("followIdList",likeService.followIdList(memberVO.getMemberID()));
		}else {
			model.addAttribute("scrapIdList","not");
			model.addAttribute("likeIdList","not");
			model.addAttribute("followIdList","not");
		}
		
		// model에 통합 검색결과 담기 
		model.addAttribute("totalList",searchTotal);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("cri",reCri);	
		
		return "/search/result";
	}
	
	// 컨텐츠 검색결과 요청
	@RequestMapping(value="contents", method=RequestMethod.GET)
	public String searchContents(@ModelAttribute("cri") SearchCriteria cri, Model model,HttpSession session) throws Exception{
			
		EsSearchResultVO searchContents = esSearchService.getContentsSearchList(cri);
		
		SearchCriteria reCri = new SearchCriteria();
		reCri.setCnt(cri.getCnt());
		reCri.setTab(cri.getTab());
		reCri.setKeyword(cri.getKeyword());
		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchContents.getContentsCnt() != null) { pageMaker.setTotalCount(searchContents.getContentsCnt()); }
		
		// 세션에 있는 회원정보 받아오기
		MemberVO memberVO = (MemberVO)session.getAttribute("login");
		
		// model에 회원의 스크랩 리스트 담기. 
		if(memberVO != null) {
			model.addAttribute("scrapIdList",scrapService.scrapIdList(memberVO.getMemberID()));
		}
		
		// model에 검색결과 담기   
		model.addAttribute("contentsList",searchContents);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("cri",reCri);	
		return "/search/resultDetail";
	}

	// 일정 검색결과 요청
	@RequestMapping(value="plan", method = RequestMethod.GET)
	public String searchPlan(@ModelAttribute("cri") SearchCriteria cri, Model model,HttpSession session) throws Exception{
		  
		EsSearchResultVO searchPlan = esSearchService.getPlanSearchList(cri);
		
		SearchCriteria reCri = new SearchCriteria();
		reCri.setCnt(cri.getCnt());
		reCri.setTab(cri.getTab());
		reCri.setKeyword(cri.getKeyword());
		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchPlan.getPlanCnt() != null) { pageMaker.setTotalCount(searchPlan.getPlanCnt()); }
		
		// 세션에 있는 회원정보 받아오기
		MemberVO memberVO = (MemberVO)session.getAttribute("login");
		
		// model에 회원의 좋아요 리스트 담기. 
		if(memberVO != null) {
			model.addAttribute("likeIdList",likeService.likeIdList(memberVO.getMemberID()));
		}
		// model에 검색결과 담기
		model.addAttribute("planList",searchPlan);
		model.addAttribute("pageMaker",pageMaker);
		

		return "/search/resultDetail";
	}
	
	// 회원 검색결과 요청
	@RequestMapping(value="member", method = RequestMethod.GET)
	public String searchMember(@ModelAttribute("cri") SearchCriteria cri, Model model,HttpSession session) throws Exception{
		
		EsSearchResultVO searchMember= esSearchService.getMemberSearchList(cri);

		SearchCriteria reCri = new SearchCriteria();
		reCri.setCnt(cri.getCnt());
		reCri.setTab(cri.getTab());
		reCri.setKeyword(cri.getKeyword());
		
		SearchPageMaker pageMaker = new SearchPageMaker();
		pageMaker.setCri(cri);
		if(searchMember.getMemberCnt() != null) { pageMaker.setTotalCount(searchMember.getMemberCnt()); }
		
		// 세션에 있는 회원정보 받아오기
		MemberVO memberVO = (MemberVO)session.getAttribute("login");
		
		// model에 회원의 팔로우 리스트 담기. 
		if(memberVO != null) {
			model.addAttribute("followIdList",likeService.followIdList(memberVO.getMemberID()));
		}
		// model에 검색결과 담기
		model.addAttribute("memberList",searchMember);
		model.addAttribute("pageMaker",pageMaker);

		return "/search/resultDetail";
	}
	
}