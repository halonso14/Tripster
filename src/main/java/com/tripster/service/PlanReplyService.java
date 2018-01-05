package com.tripster.service;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlanReplyVO;

public interface PlanReplyService {
	//댓글 등록.
	public void register(PlanReplyVO vo) throws Exception;
	
	//댓글 수정.
	public void update(PlanReplyVO vo)throws Exception;
	
	//댓글 삭제
	public void delete(int planReplyID)throws Exception;
	
	//댓글 조회.
	public List<PlanReplyVO> read(int planID, Criteria cri) throws Exception;
	
	//댓글 수 카운트.
	public int count(int planID) throws Exception;
}