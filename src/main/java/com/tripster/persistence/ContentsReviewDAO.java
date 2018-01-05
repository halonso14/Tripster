package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.domain.Criteria;

public interface ContentsReviewDAO {
	//컨텐츠 리뷰 작성
	public void write(ContentsReviewVO vo) throws Exception;
	
	//컨텐츠 리뷰 수정
	public void modify(ContentsReviewVO vo) throws Exception;
	
	//컨텐츠 리뷰 삭제
	public void delete(Integer reviewID) throws Exception;
	
	//특정 컨텐츠의 리뷰 목록 조회
	public List<ContentsReviewVO> getReviewList(Integer contentsID, Criteria cri) throws Exception;
	
	//특정 컨텐츠의 리뷰 개수 조회
	public int getTotalReviewNum(Integer contentsID) throws Exception;
	
	//리뷰 대상 컨텐츠의 ID 조회
	public int getContentsID(Integer contentsReviewID) throws Exception;

	//검색 구현 시 추가
	
	// 파일 이름 저장
	public void registReviewPicture(String fileName) throws Exception;
	
	// 파일 이름 조회
	public List<String> getFileNames(Integer reviewID) throws Exception;
}
