package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.ScrapVO;

public interface ScrapDAO {
	
	// 리스트 조회
	public List<ScrapVO> listAll(Integer memberid) throws Exception;
	// 스크랩 추가
	public void insert(ScrapVO vo) throws Exception;
	// 스크랩 리스트에서 스크랩 삭제
	public void scrapIDRemove(Integer scrapID) throws Exception;
	// 컨텐츠 조회
	public ContentsVO read(Integer id) throws Exception;
	// 컨텐츠에서 스크랩 삭제
	public void contentsScrapDelete(Integer contentsID) throws Exception;
	
}
