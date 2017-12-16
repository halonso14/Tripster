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
		contentsDao.updateReviewCnt(vo.getContentsID(), 1);
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
		contentsDao.updateReviewCnt(contentsID, -1);
	}

	@Override
	public List<ContentsReviewVO> getReviewList(Integer contentsID, Criteria cri) throws Exception {
		return dao.getReviewList(contentsID, cri);
	}

	@Override
	public int getTotalReviewNum(Integer contentsID) throws Exception {
		return dao.getTotalReviewNum(contentsID);
	}
}
