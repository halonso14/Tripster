package com.tripster.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripster.domain.Criteria;
import com.tripster.domain.PageMaker;
import com.tripster.service.RestaurantService;

@Controller
@RequestMapping("/restaurants/*")
public class RestaurantController {
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	@Inject
	private RestaurantService service;
	
	@RequestMapping(value = "/restaurantList", method = RequestMethod.GET)
	public void restaurantList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//		logger.info(cri.toString());

		model.addAttribute("list", service.getRestaurantList(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.getTotalRestaurantNum(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/restaurantDetail", method = RequestMethod.GET)
	public void restaurantDetail(@RequestParam("restaurantID") int restaurantID, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//		logger.info(cri.toString());
		model.addAttribute(service.getRestaurantDetail(restaurantID));
	}
}