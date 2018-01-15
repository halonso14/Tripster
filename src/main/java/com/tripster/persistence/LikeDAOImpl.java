package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.FollowVO;
import com.tripster.domain.LikeVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;

@Repository
public class LikeDAOImpl implements LikeDAO{
	
	@Inject
	SqlSession session;
	
	private String namespace = "likeMapper";
	
	// 좋아요 추가
	@Override
	public void like(LikeVO vo) throws Exception{
		session.insert(namespace+".like",vo);
	}
	
	// 좋아요 카운트 갱신
	@Override
	public void updateLike(Integer planID,Integer amount) throws Exception{
		Map<String, Object> Map = new HashMap<String, Object>();
		
		Map.put("planID", planID);
		Map.put("amount", amount);
		
		session.update(namespace + ".updateReviewCnt", Map);
	}

	// 일정 조회
	@Override
	public PlanVO userSchedule(Integer planID) throws Exception{
		return session.selectOne(namespace+".userSchedule", planID);
	}
	
	// 좋아요 삭제
	@Override
	public void likeDelete(Integer planID) throws Exception{
		session.delete(namespace+".likeDelete",planID);
	}
	
	// 유저의 좋아요 리스트
	@Override
	public List<LikeVO> likeList(Integer memberID) throws Exception{
		return session.selectList(namespace+".likeList", memberID);
	}
	
	// 멤버  팔로우
	@Override
	public void memberFollow(Integer memberID,Integer userID) throws Exception{
		HashMap<String,Integer> map = new HashMap<>();
		map.put("followID", userID);
		map.put("memberID", memberID);
		System.out.println(map.toString());
		session.insert(namespace+".memberFollow",map);
	}
	
	// 멤버 팔로우 삭제
	@Override
	public void memberFollowDelete(Integer memberID,Integer userID) throws Exception{
		HashMap<String,Integer> map = new HashMap<>();
		map.put("memberID", memberID);
		map.put("followID", userID);
		session.delete(namespace+".memberFollowDelete",map);
	}
	
	// 유저의 팔로우 리스트 조회
	@Override
	public List<FollowVO> memberFollowList(Integer memberID) throws Exception{
		return session.selectList(namespace+".memberFollowList", memberID);
	}
	
	// 유저의 좋아요 리스트의 플랜 조회
	@Override
	public List<PlanVO> userLikeList(Integer memberID) throws Exception{
		return session.selectList(namespace+".userlikeList", memberID);
	}
	
	// 유저의 팔로우 리스트 조회
	@Override
	public List<MemberVO> userFollowList(Integer memberID) throws Exception{
		return session.selectList(namespace+".userFollowList",memberID);
	}
	
	// 유저의 팔로잉 리스트 조회
	@Override
	public List<MemberVO> userFollowingList(Integer memberID) throws Exception{
		return session.selectList(namespace+".userFollowingList",memberID);

	}
	
	

}
