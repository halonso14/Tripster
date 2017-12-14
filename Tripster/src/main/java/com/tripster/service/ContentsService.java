package com.tripster.service;

import java.util.List;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;

public interface ContentsService {
	//컨텐츠 상세 정보 조회
	public ContentsVO getContentsDetail(Integer contentsID) throws Exception;
	
	//컨텐츠 리스트 조회
	public List<ContentsVO> getContentsList(Criteria cri) throws Exception;
	
	//총 컨텐츠 개수 조회
	public int getTotalContentsNum(Criteria cri) throws Exception;
}