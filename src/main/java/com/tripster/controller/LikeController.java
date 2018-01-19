package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;
import com.tripster.service.LikeService;

@RestController
public class LikeController {
	
	@Inject
	LikeService service;
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapModuleController.class);

	// 좋아요 추가
	@RequestMapping(value="/like/{planID}",method=RequestMethod.POST)
	public ResponseEntity<String> like(@PathVariable("planID")Integer planID,HttpSession session ){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			// 접속중인 회원
			MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
			Integer memberID = memberVO.getMemberID();
			service.like(memberID,planID);
			entity = new ResponseEntity<>("success",HttpStatus.OK);
			
		}catch(Exception e) {
			
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
			
		return entity;
	}
	
	// 좋아요 삭제
	@RequestMapping(value="/likeDelete/{planID}",method=RequestMethod.POST)
	public ResponseEntity<String> likeDelete(@PathVariable("planID")Integer planID,HttpSession session ){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			// 접속중인 회원
			MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
			Integer memberID = memberVO.getMemberID();
			service.likeDelete(memberID,planID);
			entity = new ResponseEntity<>("delete",HttpStatus.OK);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 유저 follow
	@RequestMapping(value="/memberFollow/{followID}",method=RequestMethod.POST)
	public ResponseEntity<String> memberFollow(@PathVariable("followID") Integer followID,HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		// 접속중인 회원	
		MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
		Integer memberID = memberVO.getMemberID();
		
		try {
			service.memberFollow(memberID,followID);
			entity = new ResponseEntity<>("follow",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	// 유저 follow 삭제
	@RequestMapping(value="/memberFollowDelete/{followID}",method=RequestMethod.POST)
	public ResponseEntity<String> memberFollowDelete(@PathVariable("followID") Integer followID,HttpSession session){
		
		ResponseEntity<String> entity = null;
		// 접속중인 회원	
		MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
		Integer memberID = memberVO.getMemberID();
				
		try {
			service.memberFollowDelete(memberID,followID);
			entity = new ResponseEntity<>("followDelete",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 유저 좋아요 리스트 조회
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
	
	// 좋아요 체크
	@RequestMapping(value="/likeCheck/{planID}",method=RequestMethod.POST)
	public ResponseEntity<Integer> likeCheck (@PathVariable("planID") Integer planID,HttpSession session) {
		
		ResponseEntity<Integer> entity = null;
		// 접속중인 회원
		MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
		Integer memberID = memberVO.getMemberID();
		
		try {
			Integer check = service.likeCheck(planID, memberID);
			entity = new ResponseEntity<>(check,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	// 팔로우 체크
	@RequestMapping(value="/followCheck/{followID}",method=RequestMethod.POST)
	public ResponseEntity<Integer> followCheck (@PathVariable("followID") Integer followID,HttpSession session) {
		
		ResponseEntity<Integer> entity = null;
		
		// 접속중인 회원 아이디
		MemberVO memberVO = (MemberVO) session.getAttribute("login"); 
		Integer memberID = memberVO.getMemberID();
		
		try {
			
			Integer check = service.followCheck(followID, memberID);
			entity = new ResponseEntity<>(check,HttpStatus.OK);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
}
	