package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceVO;
import com.tripster.persistence.PlaceDAO;

@Service
public class PlaceServiceImpl implements PlaceService {
	
	@Inject 
	private PlaceDAO dao;
	
	//맛집 상세 정보 조회
	@Transactional
	@Override
	public PlaceVO getPlaceDetail(Integer placeID) throws Exception {
		dao.updatePlaceViewCnt(placeID);
		return dao.read(placeID);
	}
	
	//맛집 리스트 조회
	@Override
	public List<PlaceVO> getPlaceList(Criteria cri) throws Exception {
		return dao.getPlaceList(cri);
	}
	
	//총 맛집 정보 개수 조회
	@Override
	public int getTotalPlaceNum(Criteria cri) throws Exception {
		return dao.getTotalPlaceNum(cri);
	}
}
