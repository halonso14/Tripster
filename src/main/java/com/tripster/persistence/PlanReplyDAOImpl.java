package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlanReplyVO;

@Repository
public class PlanReplyDAOImpl implements PlanReplyDAO{

	@Inject
	private SqlSession session;
	
	public String namespace = "com.tripster.mapper.planReplyMapper";
	
	//해당 플랜의 전체 댓글 조회.
	@Override
	public List<PlanReplyVO> list(int planID, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("planID", planID);
		paramMap.put("cri", cri);
		
		return  session.selectList(namespace+".read", paramMap);
	}

	//댓글 등록.
	@Override
	public void register(PlanReplyVO vo) throws Exception {
		session.insert(namespace+".insert",vo);
	}

	//댓글 수정.
	@Override
	public void update(PlanReplyVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	//댓글 삭제.
	@Override
	public void delete(int planReplyID) throws Exception {
		session.delete(namespace+".delete", planReplyID);
	}

	//댓글 수 카운트.
	@Override
	public int count(int planID) throws Exception {
		return session.selectOne(namespace+".count", planID);
	}

	//멤버 이름 조회.
	@Override
	public String selectMemberName(int memberID) throws Exception {
		return session.selectOne(namespace+".memberName",memberID);
	}
	
	
	
}
