package com.tripster.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.Criteria;
import com.tripster.domain.FollowVO;
import com.tripster.domain.LikeVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;
import com.tripster.persistence.LikeDAO;
import com.tripster.persistence.PlanDAO;
import com.tripster.persistence.PlanDetailDAO;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Inject
	LikeDAO likeDAO;
	
	@Inject
	PlanDAO planDAO;
	
	@Inject
	PlanDetailDAO planDetailDAO;
	
	// 좋아요 
	@Transactional
	@Override
	public void like(int memberID,int planID) throws Exception{
		likeDAO.updateLikeCnt(planID, 1);
		likeDAO.like(memberID,planID);
	}
	
	// 유저의 플랜 조회
	@Override
	public PlanVO userSchedule(int planID) throws Exception{
		return likeDAO.userSchedule(planID);
	}
	
	// 좋아요 삭제
	@Transactional
	@Override
	public void likeDelete(int memberID,int planID) throws Exception{
		likeDAO.updateLikeCnt(planID, -1);
		likeDAO.likeDelete(memberID,planID);
	}

	// 유저의 좋아요 체크
	public int likeCheck(int planID,int memberID) throws Exception{
		
		List<LikeVO> list = likeDAO.likeList(memberID);
		
		for(int i=0;i<list.size();i++) {
			if(planID == list.get(i).getPlanID()) {
				return 1;
			}
		}
		return 0;
	}
	
	// 멤버 팔로우
	@Override
	public void memberFollow(int memberID,int followID) throws Exception{
		likeDAO.memberFollow(memberID,followID);
	}
	
	// 멤버 팔로우 삭제
	@Override
	public void memberFollowDelete(int memberID,int followID) throws Exception{
		likeDAO.memberFollowDelete(memberID,followID);
	}
	
	// 유저 팔로우 체크
	@Override
	public int followCheck(int memberID,int followID) throws Exception{
		
		List<FollowVO> list = likeDAO.followList(memberID);
		
		for(int i=0;i<list.size();i++) {
			if(followID == list.get(i).getFollowID()) {
				return followID;
			}
		}
		return 0;
	}
	
	// 유저 좋아요 리스트의 플랜조회
	@Override
	public List<PlanVO> userLikeList(int memberID, Criteria cri) throws Exception{
		
		List<PlanVO> list = new ArrayList<>();
		list = likeDAO.userLikeList(memberID, cri);
		
		for( int i=0; i<list.size(); i++) {
			int planID = list.get(i).getPlanID();
			
			list.get(i).setPlanDetailVO(planDetailDAO.selectAllByPlanID(planID));
		}
		
		return list;
	}
		
	// 유저의 팔로우 리스트
	@Override
	public List<MemberVO> userFollowList(int memberID, Criteria cri) throws Exception{
		return likeDAO.userFollowList(memberID, cri);
	}
	
	// 유저의 팔로잉 리스트
	@Override
	public List<MemberVO> userFollowingList(int memberID, Criteria cri) throws Exception{
		return likeDAO.userFollowingList(memberID, cri);

	}

	@Override
	public List<FollowVO> followList(int memberID) throws Exception{
		return likeDAO.followList(memberID);
	}
	
	//***** searchController에서 사용합니다.*****
	
	@Override
	public List<Integer> likeIdList(int memberID) throws Exception{
		// 회원이 좋아하는 일정리스트 조회 
		List<LikeVO> list = likeDAO.likeList(memberID);
		// 좋아요한 일정아이디만 리스트로 담아서 리턴.
		List<Integer> likeIdList = new ArrayList<Integer>();
		try {
			for(int i=0; i<list.size(); i++) {
				likeIdList.add(list.get(i).getPlanID());
			}
		}catch(Exception e) {
			return likeIdList;
		}	
		return likeIdList;
	}	
	@Override
	public List<Integer> followIdList(int memberID) throws Exception{
		// 회원이 팔로우하는 유저리스트 조회 
		List<FollowVO> list = likeDAO.followList(memberID);
		// 팔로잉한 멤버아이디만 리스트로 담아서 리턴 
		List<Integer> followIdList = new ArrayList<Integer>();
		try {
			for(int i=0; i<list.size(); i++) {
				followIdList.add(list.get(i).getFollowID());
			}
		}catch(Exception e) {
			return followIdList;
		}		
		return followIdList;
	}

}
