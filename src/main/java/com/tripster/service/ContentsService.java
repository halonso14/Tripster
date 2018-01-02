package com.tripster.service;

import java.util.List;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;

public interface ContentsService {
	//맛집 상세 정보 조회
	public ContentsVO getRestaurantDetail(Integer contentsID) throws Exception;
	
	//관광지 상세 정보 조회
	public ContentsVO getPlaceDetail(Integer contentsID) throws Exception;
	
	//맛집 리스트 조회
	public List<ContentsVO> getRestaurantList(Criteria cri) throws Exception;
		
	//관광지 리스트 조회
	public List<ContentsVO> getPlaceList(Criteria cri) throws Exception;
	
	//총 맛집 개수 조회
	public int getTotalRestaurantNum(Criteria cri) throws Exception;
		
	//총 관광지 개수 조회
	public int getTotalPlaceNum(Criteria cri) throws Exception;
}