package com.tripster.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripster.service.ScrapService;

@Controller
@RequestMapping("/*")
public class ScrapController {
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapController.class);
	
	@Inject
	private ScrapService scrapService;
	
	@RequestMapping(value="/mypage/scraplist",method=RequestMethod.GET)
	public void scraplist(@RequestParam("Member_ID") int Member_ID,Model model) throws Exception {
		
		loger.info("scrap list");
		
		model.addAttribute("list",scrapService.listAll(Member_ID));
		
	}
	
	@RequestMapping(value="/scraplist",method=RequestMethod.POST)
	public String scraplistRemove(@RequestParam("scrapID") int scrapID) throws Exception {
		
		loger.info("scrapid:"+scrapID);
		
		scrapService.delete(scrapID);
		
		return "redirect:/mypage/scraplist?Member_ID=1";
	}
	
	@RequestMapping(value="/contents/foody",method=RequestMethod.POST)
	public String scrap(@RequestParam("Restaurant_ID") int Restaurant_ID,
						@RequestParam("scrap") boolean scrap,Model model) throws Exception {
		
		scrapService.scrap(Restaurant_ID);
		model.addAttribute("tf", scrap);
		
		loger.info("");

		return "redirect:/contents/foody?Restaurant_ID="+Restaurant_ID;
	}
	
}
