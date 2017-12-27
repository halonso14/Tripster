package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlanReplyVO;

public interface PlanReplyDAO {
	
	//해당 plan에 달린 댓글 전체 조회.
	public List<PlanReplyVO> list(int planID, Criteria cri)throws Exception;
	
	//댓글 등록
	public void register(PlanReplyVO vo)throws Exception;
	
	//댓글 수정
	public void update(PlanReplyVO vo)throws Exception;
	
	//댓글 삭제.
	public void delete(int planReplyID)throws Exception;
	
	//댓글 수 카운트.
	public int count(int planID) throws Exception;
	
	//멤버 이름 조회.
	public String selectMemberName(int memberID) throws Exception;
}
