package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.FollowVO;
import com.tripster.domain.LikeVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;

public interface LikeDAO {
	
	// 좋아요 추가
	public void like(Integer memberID,Integer planID) throws Exception;
	
	// 유저 일정 조회
	public PlanVO userSchedule(Integer planID) throws Exception;
	
	// 좋아요 삭제
	public void likeDelete(Integer memberID,Integer planID) throws Exception;
	
	// 유저의 좋아요 리스트
	public List<LikeVO> likeList(Integer memberID) throws Exception;
	
	// 멤버  팔로우
	public void memberFollow(Integer memberID,Integer followID) throws Exception;
	
	// 멤버 팔로우 삭제
	public void memberFollowDelete(Integer memberID,Integer followID) throws Exception;
	
	// 유저의 팔로우 리스트 조회
	public List<FollowVO> followList(Integer memberID) throws Exception;
	
	// 유저의 좋아요 리스트의 플랜 조회
	public List<PlanVO> userLikeList(Integer memberID, Criteria cri) throws Exception;
	
	// 유저의 팔로우 리스트 조회
	public List<MemberVO> userFollowList(Integer memberID, Criteria cri) throws Exception;
	
	// 유저의 팔로잉 리스트 조회
	public List<MemberVO> userFollowingList(Integer memberID, Criteria cri) throws Exception;
	
	// 좋아요 카운트 갱신
	public void updateLikeCnt(Integer planID, int amount) throws Exception;

}