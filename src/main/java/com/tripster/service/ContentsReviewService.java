package com.tripster.service;

import java.util.List;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.domain.Criteria;

public interface ContentsReviewService {
	//맛집 리뷰 작성
	public void writeReview(ContentsReviewVO vo) throws Exception;
	
	//맛집 리뷰 수정
	public void modifyReview(ContentsReviewVO vo) throws Exception;
		
	//맛집 리뷰 삭제
	public void deleteReview(Integer contentsReviewID) throws Exception;
		
	//특정 맛집의 리뷰 목록 조회
	public List<ContentsReviewVO> getReviewList(Integer contentsID, Criteria cri) throws Exception;
		
	//특정 맛집의 리뷰 개수 조회
	public int getTotalReviewNum(Integer contentsID) throws Exception;
	
	//리뷰 아이디를 받아 파일 이름 조회
	public List<String> getFileNames(Integer reviewID) throws Exception;
	
}
