package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.Criteria;
import com.tripster.domain.FollowVO;
import com.tripster.domain.LikeVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;

@Repository
public class LikeDAOImpl implements LikeDAO {

	@Inject
	SqlSession session;

	private String namespace = "likeMapper";

	// 좋아요 추가
	@Override
	public void like(Integer memberID, Integer planID) throws Exception {

		Map<String, Integer> map = new HashMap<>();
		map.put("memberID", memberID);
		map.put("planID", planID);
		session.insert(namespace + ".like", map);

	}

	// 일정 조회
	@Override
	public PlanVO userSchedule(Integer planID) throws Exception {
		return session.selectOne(namespace + ".userSchedule", planID);
	}

	// 좋아요 삭제
	@Override
	public void likeDelete(Integer memberID, Integer planID) throws Exception {

		Map<String, Integer> map = new HashMap<>();
		map.put("memberID", memberID);
		map.put("planID", planID);
		session.delete(namespace + ".likeDelete", map);

	}

	// 유저의 좋아요 리스트
	@Override
	public List<LikeVO> likeList(Integer memberID) throws Exception {
		return session.selectList(namespace + ".likeList", memberID);
	}

	// 멤버 팔로우
	@Override
	public void memberFollow(Integer memberID, Integer followID) throws Exception {

		HashMap<String, Integer> map = new HashMap<>();
		map.put("followID", followID);
		map.put("memberID", memberID);
		session.insert(namespace + ".memberFollow", map);

	}

	// 멤버 팔로우 삭제
	@Override
	public void memberFollowDelete(Integer memberID, Integer followID) throws Exception {

		HashMap<String, Integer> map = new HashMap<>();
		map.put("memberID", memberID);
		map.put("followID", followID);
		session.delete(namespace + ".memberFollowDelete", map);

	}

	// 유저의 팔로우 리스트 조회
	@Override
	public List<FollowVO> followList(Integer memberID) throws Exception {
		return session.selectList(namespace + ".followList", memberID);
	}

	// 유저의 좋아요 리스트의 플랜 조회
	@Override
	public List<PlanVO> userLikeList(Integer memberID, Criteria cri) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("memberID", memberID);
		paramMap.put("cri", cri);

		return session.selectList(namespace + ".userlikeList", paramMap);
	}

	// 유저의 팔로우 리스트 조회
	@Override
	public List<MemberVO> userFollowList(Integer memberID, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("memberID", memberID);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".userFollowList", paramMap);
	}

	// 유저의 팔로잉 리스트 조회
	@Override
	public List<MemberVO> userFollowingList(Integer memberID, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("memberID", memberID);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".userFollowingList", paramMap);

	}

}