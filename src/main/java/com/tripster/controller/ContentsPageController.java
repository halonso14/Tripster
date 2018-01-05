package com.tripster.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripster.service.ContentsService;
import com.tripster.service.ScrapService;

@Controller
@RequestMapping("/contentsPage/*")
public class ContentsPageController {
	
	@Inject
	ContentsService contentsService;
	@Inject
	ScrapService scrapService;
	
	// 컨텐츠 페이지
	@RequestMapping(value="/contents/{contentsID}",method=RequestMethod.GET)
	public String foodyPage(@PathVariable("contentsID") Integer contentsID, Model model) throws Exception {
		
		// 컨텐츠 ID 전달
		model.addAttribute(contentsService.getRestaurantDetail(contentsID));

		return "contentsPage/contents";
	}

}
