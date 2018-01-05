package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlanReplyVO;
import com.tripster.persistence.PlanReplyDAO;
@Service
public class PlanReplyServiceImpl implements PlanReplyService{

	@Inject
	private PlanReplyDAO planReplyDAO;
	
	//댓글 등록
	@Override
	public void register(PlanReplyVO vo) throws Exception {
		planReplyDAO.register(vo);
	}

	//댓글 수정.
	@Override
	public void update(PlanReplyVO vo) throws Exception {
		planReplyDAO.update(vo);
	}

	//댓글 삭제.
	@Override
	public void delete(int planReplyID) throws Exception {
		planReplyDAO.delete(planReplyID);
	}

	//댓글 전체 조회.
	@Override
	public List<PlanReplyVO> read(int planID, Criteria cri) throws Exception {
		List<PlanReplyVO> list=  planReplyDAO.list(planID, cri);
		
		for(int i=0; i<list.size();i++) {
			String name = planReplyDAO.selectMemberName(list.get(i).getMemberID());
			list.get(i).setMemberName(name);
		}
		
		return list;
	}

	//댓글 카운트 .
	@Override
	public int count(int planID) throws Exception {
		return planReplyDAO.count(planID);
	}

	
}