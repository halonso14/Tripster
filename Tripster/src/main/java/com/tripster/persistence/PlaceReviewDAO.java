package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceReviewVO;

public interface PlaceReviewDAO {
	//맛집 리뷰 작성
	public void write(PlaceReviewVO vo) throws Exception;
	
	//맛집 리뷰 수정
	public void modify(PlaceReviewVO vo) throws Exception;
	
	//맛집 리뷰 삭제
	public void delete(Integer reviewID) throws Exception;
	
	//특정 맛집의 리뷰 목록 조회
	public List<PlaceReviewVO> getPlaceReviewList(Integer placeID, Criteria cri) throws Exception;
	
	//특정 맛집의 리뷰 개수 조회
	public int getTotalPlaceReviewNum(Integer placeID) throws Exception;
	
	//리뷰 대상 맛집의 ID 조회
	public int getPlaceID(Integer placeReviewID) throws Exception;

	//검색 구현 시 추가
}
