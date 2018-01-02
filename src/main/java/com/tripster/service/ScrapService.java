package com.tripster.service;

import java.util.List;

import com.tripster.domain.ScrapVO;

public interface ScrapService {
	
	// 스크랩 추가
	public void scrap(Integer contentsID,Integer memberID)throws Exception;
	
	// 스크랩 삭제
	public void scrapDelete(Integer contentsID) throws Exception;
	
	// 스크랩 리스트 조회
	public List<ScrapVO> listAll(Integer memberID) throws Exception;
	
	// 컨텐츠에서 스크랩 삭제
	public void scrapIDRemove(Integer contentsID) throws Exception;
	
	// 스크랩 확인
	public Integer scrapCheck(Integer contentsID,Integer memberID) throws Exception;
		
}
