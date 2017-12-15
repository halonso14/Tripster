package com.tripster.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.ScrapVO;
import com.tripster.service.ContentsService;
import com.tripster.service.ScrapService;

@Controller
@RequestMapping("/contents/*")
public class ContentsController {
	
private static final Logger loger = LoggerFactory.getLogger(ScrapController.class);
	

	@Inject
	private ContentsService service;	

	@RequestMapping(value="/foody",method=RequestMethod.GET)
	public void foody(@RequestParam("Restaurant_ID") int Restaurant_ID,Model model) throws Exception {
		
		loger.info("foody page");
		model.addAttribute(service.read(Restaurant_ID));
		model.addAttribute("tf","0");
	}
	

}
