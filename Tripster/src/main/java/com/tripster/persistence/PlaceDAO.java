package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceVO;

public interface PlaceDAO {
	//관광지 상세 정보 조회
	public PlaceVO read(Integer placeID) throws Exception;
	
	//관광지 조회수 수정
	public void updatePlaceViewCnt(Integer placeID) throws Exception;
	
	//관광지 리스트 조회
	public List<PlaceVO> getPlaceList(Criteria cri) throws Exception;
	
	//총 관광지 정보 개수 조회
	public int getTotalPlaceNum(Criteria cri) throws Exception;
	
	//관광지 리뷰 개수 수정
	public void updatePlaceReviewCnt(Integer placeID, int amount) throws Exception;
	
	//조회수 + 검색 + @
}
