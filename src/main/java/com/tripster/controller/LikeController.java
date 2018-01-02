package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tripster.domain.LikeVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;
import com.tripster.service.LikeService;

@RestController
public class LikeController {
	
	@Inject
	LikeService service;
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapModuleController.class);

	// 좋아요 추가
	@RequestMapping(value="/like",method=RequestMethod.POST)
	public ResponseEntity<String> like(@RequestBody LikeVO vo ){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			service.like(vo);
			entity = new ResponseEntity<>("success",HttpStatus.OK);
			
		}catch(Exception e) {
			
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
			
		return entity;
	}
	
	// 좋아요 삭제
	@RequestMapping(value="/likeDelete/{planID}",method=RequestMethod.POST)
	public ResponseEntity<String> likeDelete(@PathVariable("planID")Integer planID){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			service.likeDelete(planID);
			entity = new ResponseEntity<>("delete",HttpStatus.OK);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 유저 follow
	@RequestMapping(value="/memberFollow/{memberID}/{userID}",method=RequestMethod.POST)
	public ResponseEntity<String> memberFollow(@PathVariable("memberID") Integer memberID,
												@PathVariable("userID") Integer userID){
		
		ResponseEntity<String> entity = null;
		
		try {
			service.memberFollow(memberID,userID);
			entity = new ResponseEntity<>("follow",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	// 유저 follow 삭제
	@RequestMapping(value="/memberFollowDelete/{memberID}/{userID}",method=RequestMethod.POST)
	public ResponseEntity<String> memberFollowDelete(@PathVariable("memberID") Integer memberID,@PathVariable("userID") Integer userID){
		
		ResponseEntity<String> entity = null;
		
		try {
			service.memberFollowDelete(memberID,userID);
			entity = new ResponseEntity<>("followDelete",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 유저 좋아요 리스트의 플랜 조회
	@RequestMapping(value="/userLikeList/{memberID}")
	public ResponseEntity<List<PlanVO>> userLikeList(@PathVariable("memberID") Integer memberID){
		
		ResponseEntity<List<PlanVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.userLikeList(memberID),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	// 유저의 팔로우 리스트 조회
	@RequestMapping(value="/userFollowList/{memberID}")
	public ResponseEntity<List<MemberVO>> userFollowList(@PathVariable("memberID") Integer memberID){
		
		ResponseEntity<List<MemberVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.userFollowList(memberID),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 유저의 팔로잉 리스트 조회
	@RequestMapping(value="/userFollowingList/{memberID}")
	public ResponseEntity<List<MemberVO>> userFollowingList(@PathVariable("memberID") Integer memberID){
		
		ResponseEntity<List<MemberVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.userFollowingList(memberID),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
	


