package com.tripster.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripster.service.ScrapService;

// 스크랩 페이지
@Controller
@RequestMapping("/mypage/*")
public class ScrapController {
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapController.class);
	
	@Inject
	private ScrapService service;
	
	// 스크랩 리스트 페이지
	@RequestMapping(value="/scraplist/{memberID}",method=RequestMethod.GET)
	public String scrpaList (@PathVariable("memberID") Integer memberID,Model model) throws Exception {
		
		loger.info("scrap list");
		
		model.addAttribute("memberID",memberID);
		
		return "mypage/scraplist";
		
	}
	
}
