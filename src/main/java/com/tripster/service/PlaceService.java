package com.tripster.service;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceVO;

public interface PlaceService {
	//맛집 상세 정보 조회
	public PlaceVO getPlaceDetail(Integer placeID) throws Exception;
	//맛집 리스트 조회
	public List<PlaceVO> getPlaceList(Criteria cri) throws Exception;
	//총 맛집 정보 개수 조회
	public int getTotalPlaceNum(Criteria cri) throws Exception;
}
