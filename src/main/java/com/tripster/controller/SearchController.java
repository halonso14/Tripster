package com.tripster.controller;

import java.util.HashMap;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripster.domain.SearchPageMaker;
import com.tripster.domain.SearchCriteria;
import com.tripster.elasticsearch.EsRepository;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private EsRepository repository;
	
	
	// 통합검색 결과리스트 요청
	@RequestMapping(value="/search*", method = RequestMethod.GET)
	public void search(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		//  model에 EsRepository의 검색결과를 담아서 search.jsp로 보낸다.
		model.addAttribute("search",repository.listCriteria(cri.getKeyword()));
		
		
		// model에 EsRepository의 검색결과 건수를 담아서 SearchPageMaker로 보낸다.
		SearchPageMaker pageMaker = new SearchPageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(repository.listCount(cri.getKeyword()));

		model.addAttribute("pageMaker",pageMaker);
	}
	
}
