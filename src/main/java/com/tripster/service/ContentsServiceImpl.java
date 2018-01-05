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
	
	//맛집 상세 정보 조회
	@Transactional
	@Override
	public ContentsVO getRestaurantDetail(Integer contentsID) throws Exception {
		//조회수 추가
		dao.updateViewCnt(contentsID);
		return dao.getRestaurantDetail(contentsID);
	}
	
	//관광지 상세 정보 조회
	@Transactional
	@Override
	public ContentsVO getPlaceDetail(Integer contentsID) throws Exception {
		//조회수 추가
		dao.updateViewCnt(contentsID);
		return dao.getPlaceDetail(contentsID);
	}
	
	//맛집 리스트 조회
	@Override
	public List<ContentsVO> getRestaurantList(Criteria cri) throws Exception {
		return dao.getRestaurantList(cri);
	}
	
	//관광지 리스트 조회
	@Override
	public List<ContentsVO> getPlaceList(Criteria cri) throws Exception {
		return dao.getPlaceList(cri);
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
	public void updateContentsRating(Integer contentsRating,Integer contentsID) throws Exception{
		dao.updateContentsRating(contentsRating,contentsID);
	}
	
}