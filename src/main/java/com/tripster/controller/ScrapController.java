package com.tripster.controller;

import javax.inject.Inject;
import javax.naming.LinkLoopException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripster.service.LikeService;
import com.tripster.service.ScrapService;

// 스크랩 페이지
@Controller
@RequestMapping("/mypage/*")
public class ScrapController {
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapController.class);
	
	@Inject
	private ScrapService service;
	
	@Inject
	private LikeService likeservice;
	
	// 스크랩 리스트 페이지
	@RequestMapping(value="/scraplist/{memberID}",method=RequestMethod.GET)
	public String scrpaList (@PathVariable("memberID") Integer memberID,Model model) throws Exception {
		
		loger.info("scrap list");
		
		model.addAttribute("memberID",memberID);
		
		return "mypage/scraplist";
		
	}
	
	// 유저 일정 조회
	@RequestMapping(value="/memberSchedule/{planID}")
	public String userplanList(@PathVariable("planID")Integer planID,Model model)throws Exception {
		
		// 현재 접속중인 회원
		Integer userID = 1;
		// 좋아요 체크
		Integer likeCheck = likeservice.likeCheck(planID, userID);
		// 팔로우 체크
		Integer followCheck = likeservice.followCheck(userID, planID);
		// 유저의 플랜 보내기
		model.addAttribute("plan", likeservice.userSchedule(planID));
		model.addAttribute("user",userID);
		model.addAttribute("likeCheck",likeCheck);
		model.addAttribute("followCheck", followCheck);
		
		return "plan/memberSchedule";
	}

}
