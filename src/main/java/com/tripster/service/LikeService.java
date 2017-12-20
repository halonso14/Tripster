package com.tripster.service;

import java.util.List;

import com.tripster.domain.LikeVO;
import com.tripster.domain.PlanVO;

public interface LikeService {
	
	// 좋아요추가
	public void like(LikeVO vo) throws Exception;
	
	// 유저의 일정 조회
	public PlanVO userSchedule(Integer planID) throws Exception;
	
	// 유저 삭제
	public void likeDelete(Integer planID) throws Exception;
	
	// 유저의 좋아요 체크
	public Integer likeCheck(Integer planID,Integer memberID) throws Exception;
	
	// 멤버 팔로우
	public void memberFollow(Integer memberID,Integer userID) throws Exception; 
	
	// 멤버 팔로우 삭제
	public void memberFollowDelete(Integer memberID,Integer userID) throws Exception;
	
	// 멤버 팔로우 체크
	public Integer followCheck(Integer userID,Integer memberID) throws Exception;

}
