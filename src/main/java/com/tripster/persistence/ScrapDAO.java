package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.ScrapVO;

public interface ScrapDAO {
	
	// 스크랩
	public void create(Integer memberID,Integer contentsID) throws Exception;
	
	// 스크랩 삭제
	public void scrapDelete(Integer contentsID) throws Exception;
	
	// 스크랩 리스트 조회
	public List<ScrapVO> listAll(Integer memberID) throws Exception;
	
	// 컨텐츠에서 스크랩 삭제
	public void scrapIDRemove(Integer contentsID) throws Exception;

}
