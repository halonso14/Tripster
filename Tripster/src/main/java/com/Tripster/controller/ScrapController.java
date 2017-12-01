package com.Tripster.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Tripster.domain.ScrapVO;
import com.Tripster.service.ScrapService;

@Controller
@RequestMapping("/board/*")
public class ScrapController {
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapController.class);
	
	@Inject
	private ScrapService service;
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String registerGET(ScrapVO board,Model model)throws Exception{
		
		loger.info("loger test");
		return "board/register.jsp";
		
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(ScrapVO board,Model model)throws Exception{
		
		service.regist(board);
		
		return "/board/success";
	}

}
