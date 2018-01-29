package com.tripster.service;

import java.util.List;

import com.tripster.domain.FollowVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;

public interface LikeService {
	
	// 좋아요추가
	public void like(int memberID,int planID) throws Exception;
	
	// 유저의 일정 조회
	public PlanVO userSchedule(int planID) throws Exception;
	
	// 좋아요 삭제
	public void likeDelete(int memberID,int planID) throws Exception;
	
	// 유저의 좋아요 체크
	public int likeCheck(int planID,int memberID) throws Exception;
	
	// 멤버 팔로우
	public void memberFollow(int memberID,int userID) throws Exception; 
	
	// 멤버 팔로우 삭제
	public void memberFollowDelete(int memberID,int followID) throws Exception;
	
	// 멤버 팔로우 체크
	public int followCheck(int memberID,int followID) throws Exception;
	
	// 팔로우 리스트
	public List<FollowVO> followList(int memberID) throws Exception;
	
	// 유저의 좋아요 리스트의 플랜 리스트
	public List<PlanVO> userLikeList(int memberID) throws Exception;
	
	// 유저의 팔로우 리스트
	public List<MemberVO> userFollowList(int memberID) throws Exception;
	
	// 유저의 팔로잉 리스트
	public List<MemberVO> userFollowingList(int memberID) throws Exception;
	
	//***** searchController에서 사용합니다.*****
	public List<Integer> followIdList(int memberID) throws Exception;
	public List<Integer> likeIdList(int memberID) throws Exception;
}