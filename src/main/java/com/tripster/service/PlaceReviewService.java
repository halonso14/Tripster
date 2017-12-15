package com.tripster.service;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceReviewVO;

public interface PlaceReviewService {
	//맛집 리뷰 작성
	public void writeReview(PlaceReviewVO vo) throws Exception;
	
	//맛집 리뷰 수정
	public void modifyReview(PlaceReviewVO vo) throws Exception;
		
	//맛집 리뷰 삭제
	public void deleteReview(Integer placeReviewID) throws Exception;
		
	//특정 맛집의 리뷰 목록 조회
	public List<PlaceReviewVO> getPlaceReviewList(Integer placeID, Criteria cri) throws Exception;
		
	//특정 맛집의 리뷰 개수 조회
	public int getTotalPlaceReviewNum(Integer placeID) throws Exception;
}
