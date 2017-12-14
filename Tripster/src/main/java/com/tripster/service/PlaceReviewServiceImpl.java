package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceReviewVO;
import com.tripster.persistence.PlaceDAO;
import com.tripster.persistence.PlaceReviewDAO;

@Service
public class PlaceReviewServiceImpl implements PlaceReviewService {
	
	@Inject 
	private PlaceReviewDAO dao;
	
	@Inject 
	private PlaceDAO placeDao;

	@Transactional
	@Override
	public void writeReview(PlaceReviewVO vo) throws Exception {
		dao.write(vo);
		placeDao.updatePlaceReviewCnt(vo.getPlaceID(), 1);
	}

	@Override
	public void modifyReview(PlaceReviewVO vo) throws Exception {
		dao.modify(vo);
	}

	@Transactional
	@Override
	public void deleteReview(Integer placeReviewID) throws Exception {
		Integer placeID = dao.getPlaceID(placeReviewID);
		dao.delete(placeReviewID);
		placeDao.updatePlaceReviewCnt(placeID, -1);
	}

	@Override
	public List<PlaceReviewVO> getPlaceReviewList(Integer placeID, Criteria cri) throws Exception {
		return dao.getPlaceReviewList(placeID, cri);
	}

	@Override
	public int getTotalPlaceReviewNum(Integer placeID) throws Exception {
		return dao.getTotalPlaceReviewNum(placeID);
	}
	
	
}
