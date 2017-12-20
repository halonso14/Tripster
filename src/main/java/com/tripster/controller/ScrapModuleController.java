package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tripster.domain.ScrapVO;
import com.tripster.service.ScrapService;

// 기능 구현 controller
@RestController
public class ScrapModuleController {
	
	@Inject
	private ScrapService scrapService;
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapModuleController.class);

	// 스크랩 추가 
	@RequestMapping(value="/scrap/{contentsID}",method=RequestMethod.POST)
	public ResponseEntity<String> scrap(@PathVariable("contentsID") Integer contentsID,Model model) {
		
		ResponseEntity<String> entity = null;
		
		try {
			// id 값을 받아서 스크랩 추가 
			scrapService.scrap(contentsID);
			loger.info("scrap success");
			entity = new ResponseEntity<>("success",HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 제거 
	@RequestMapping(value="/scrapDelete/{contentsID}",method=RequestMethod.POST)
	public ResponseEntity<String> scrapDelete(@PathVariable("contentsID") Integer contentsID) {
		
		ResponseEntity<String> entity = null;
		
		try {
			
			// 컨텐츠 스크랩 제거 서비스
			scrapService.scrapDelete(contentsID);
			loger.info("scrap remove");
			entity = new ResponseEntity<>("remove",HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 리스트 조회 
	@RequestMapping(value="/scraplist/{memberID}",method=RequestMethod.GET)
	public ResponseEntity<List<ScrapVO>> scrapList(@PathVariable("memberID") Integer memberID,Model model){
		
		ResponseEntity<List<ScrapVO>> entity = null;
		
		try {
			
			loger.info("scrap list");
			// 멤버 id를 받아 리스트를 조회하여 뷰단으로 전송
			entity = new ResponseEntity<>(scrapService.listAll(memberID),HttpStatus.OK);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 리스트에서 스크랩 제거 
	@RequestMapping(value="/scrapIDremove/{scrapID}",method=RequestMethod.POST)
	public ResponseEntity<String> scrapIDRemove(@PathVariable("scrapID") Integer scrapID){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			loger.info("scrpalist scrap remove");
			scrapService.scrapIDRemove(scrapID);
			entity = new ResponseEntity<>("scrapIDRemove",HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 체크
	@RequestMapping(value="/scrapCheck/{contentsID}",method=RequestMethod.POST)
	public ResponseEntity<Integer> scrapCheck(@PathVariable ("contentsID") Integer contentsID){
		
		ResponseEntity<Integer> entity = null;
		// 현재 회원
		Integer memberID = 2;
		
		try {
			Integer check = scrapService.scrapCheck(contentsID, memberID);
			entity = new ResponseEntity<>(check,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
 
}
