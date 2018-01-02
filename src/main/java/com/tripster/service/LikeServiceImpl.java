package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.FollowVO;
import com.tripster.domain.LikeVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;
import com.tripster.persistence.LikeDAO;
import com.tripster.persistence.PlanDAO;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Inject
	LikeDAO likeDAO;
	
	@Inject
	PlanDAO planDAO;
	
	// 좋아요 
	@Override
	public void like(LikeVO vo) throws Exception{
		likeDAO.like(vo);
	}
	
	// 유저의 플랜 조회
	@Override
	public PlanVO userSchedule(Integer planID) throws Exception{
		return likeDAO.userSchedule(planID);
	}
	
	// 좋아요 삭제
	@Override
	public void likeDelete(Integer planID) throws Exception{
		likeDAO.likeDelete(planID);
	}

	// 유저의 좋아요 체크
	public Integer likeCheck(Integer planID,Integer memberID) throws Exception{
		
		List<LikeVO> list = likeDAO.likeList(memberID);
		
		for(int i=0;i<list.size();i++) {
			if(planID == list.get(i).getPlanID()) {
				return 0;
			}
		}
		return 1;
	}
	
	// 멤버 팔로우
	@Override
	public void memberFollow(Integer memberID,Integer userID) throws Exception{
		likeDAO.memberFollow(memberID,userID);
	}
	
	// 멤버 팔로우 삭제
	@Override
	public void memberFollowDelete(Integer memberID,Integer userID) throws Exception{
		likeDAO.memberFollowDelete(memberID,userID);
	}
	
	// 유저 팔로우 체크
	@Override
	public Integer followCheck(Integer userID,Integer planID) throws Exception{
		
		List<FollowVO> list = likeDAO.memberFollowList(userID);
		Integer memberID = planDAO.selectPlan(planID).getMemberID();
		for(int i=0;i<list.size();i++) {
			if(memberID == list.get(i).getFollowID()) {
				// 값이 있으면 false...
				return 0;
			}
		}
		// 값이 업으면 true.,,
		return 1;
	}
	
	// 유저 좋아요 리스트의 플랜조회
	@Override
	public List<PlanVO> userLikeList(Integer memberID) throws Exception{
		return likeDAO.userLikeList(memberID);
	}
	
	// 유저의 팔로우 리스트
	@Override
	public List<MemberVO> userFollowList(Integer memberID) throws Exception{
		return likeDAO.userFollowList(memberID);
	}
	
	// 유저의 팔로잉 리스트
	@Override
	public List<MemberVO> userFollowingList(Integer memberID) throws Exception{
		return likeDAO.userFollowingList(memberID);

	}

}
