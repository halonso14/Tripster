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
	
	// 스크랩 리스트조회 페이지 맵핑
	@RequestMapping(value="/mypage/scraplist",method=RequestMethod.GET)
	public void scraplist(@RequestParam("Member_ID") int Member_ID,Model model) throws Exception {
		
		loger.info("scrap list");
		// 멤버 id를 받아 리스트를 조회하여 뷰단으로 전송
		model.addAttribute("list",scrapService.listAll(Member_ID));
		model.addAttribute("id",Member_ID);
		
	}
	
//	// 스크랩 리스트 에서 스크랩 삭제 맵핑
//	@RequestMapping(value="/scraplist",method=RequestMethod.POST)
//	public String scraplistRemove(@RequestParam("scrapID") int scrapID) throws Exception {
//		
//		loger.info("scrapid:"+scrapID);
//		// 스크랩 id를 받아 삭제 서비스
//		scrapService.scrapListDelete(scrapID);
//		
//		return "redirect:/mypage/scraplist?Member_ID=1";
//	}

}
