package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.domain.Criteria;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.ContentsReviewDAO;

@Service
public class ContentsReviewServiceImpl implements ContentsReviewService {
	
	@Inject 
	private ContentsReviewDAO dao;
	
	@Inject 
	private ContentsDAO contentsDao;

	@Transactional
	@Override
	public void writeReview(ContentsReviewVO vo) throws Exception {
		dao.write(vo);
		contentsDao.updateContentsReviewCnt(vo.getContentsID(), 1);
	}

	@Override
	public void modifyReview(ContentsReviewVO vo) throws Exception {
		dao.modify(vo);
	}

	@Transactional
	@Override
	public void deleteReview(Integer contentsReviewID) throws Exception {
		Integer contentsID = dao.getContentsID(contentsReviewID);
		dao.delete(contentsReviewID);
		contentsDao.updateContentsReviewCnt(contentsID, -1);
	}

	@Override
	public List<ContentsReviewVO> getContentsReviewList(Integer contentsID, Criteria cri) throws Exception {
		return dao.getContentsReviewList(contentsID, cri);
	}

	@Override
	public int getTotalContentsReviewNum(Integer contentsID) throws Exception {
		return dao.getTotalContentsReviewNum(contentsID);
	}
	
	
}
