package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;
import com.tripster.persistence.ContentsDAO;

@Service
public class ContentsServiceImpl implements ContentsService {
	
	@Inject 
	private ContentsDAO dao;
	
	//컨텐츠 상세 정보 조회
	@Transactional
	@Override
	public ContentsVO getContentsDetail(Integer contentsID) throws Exception {
		dao.updateContentsViewCnt(contentsID);
		return dao.read(contentsID);
	}
	
	//컨텐츠 리스트 조회
	@Override
	public List<ContentsVO> getContentsList(Criteria cri) throws Exception {
		return dao.getContentsList(cri);
	}
	
	//총 컨텐츠 개수 조회
	@Override
	public int getTotalContentsNum(Criteria cri) throws Exception {
		return dao.getTotalContentsNum(cri);
	}
}
