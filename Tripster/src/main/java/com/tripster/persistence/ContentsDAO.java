package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;

public interface ContentsDAO {
	//컨텐츠 상세 정보 조회
	public ContentsVO read(Integer contentsID) throws Exception;
	
	//컨텐츠 리스트 조회
	public List<ContentsVO> getContentsList(Criteria cri) throws Exception;
	
	//총 컨텐츠 정보 개수 조회
	public int getTotalContentsNum(Criteria cri) throws Exception;
	
	//컨텐츠 조회수 수정
	public void updateContentsViewCnt(Integer contentsID) throws Exception;
		
	//컨텐츠 리뷰 개수 수정
	public void updateContentsReviewCnt(Integer contentsID, int amount) throws Exception;
	
	//컨텐츠 스크랩 횟수 수정
	public void updateContentsScrapCnt(Integer contentsID, int amount) throws Exception;

	//카테고리별 개수 + 검색 + @
}
