package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;
import com.tripster.persistence.ContentsDAO;

@Service
public class ContentsServiceImpl implements ContentsService {
	
	@Inject 
	private ContentsDAO dao;
	
	//컨텐츠 상세 정보 조회
	@Transactional
	@Override
	public ContentsVO getContentsDetail(Integer contentsID) throws Exception {
		//조회수 추가
		dao.updateViewCnt(contentsID);
		return dao.getContentsDetail(contentsID);
	}

	//총 맛집 개수 조회
	@Override
	public int getTotalRestaurantNum(Criteria cri) throws Exception {
		return dao.getTotalRestaurantNum(cri);
	}
	
	//총 관광지 개수 조회
	@Override
	public int getTotalPlaceNum(Criteria cri) throws Exception {
		return dao.getTotalPlaceNum(cri);
	}
	
	//컨텐츠 평점
	@Override
	public void updateContentsRating(Integer contentsID, double contentsRating) throws Exception{
		dao.updateContentsRating(contentsID,contentsRating);
	}
	
	// 컨텐츠 스크랩카운트 조회
	@Override
	public Integer getScrapCnt(Integer contentsID) throws Exception{
		return dao.getScrapCnt(contentsID);
	}
}