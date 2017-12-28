package com.tripster.service;

import java.util.*;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.EsContentsVO;
import com.tripster.domain.EsPlanVO;
import com.tripster.domain.EsSearchResult;
import com.tripster.domain.EsMemberVO;
import com.tripster.persistence.EsContentsDAO;
import com.tripster.persistence.EsPlanDAO;
import com.tripster.persistence.EsMemberDAO;
import com.tripster.domain.SearchCriteria;

@Service
public class EsSearchServiceimpl implements EsSearchService {
	
	@Inject
	private EsContentsDAO contentsDao;
	@Inject
	private EsPlanDAO planDao;
	@Inject
	private EsMemberDAO memberDao;
	
	
	// 통합검색결과 리스트 조회 
	public EsSearchResult getTotalSearchList(SearchCriteria cri) throws Exception{
		
		EsSearchResult result = new EsSearchResult();
		
		result.contentsList = contentsDao.getContentsList(cri);
		result.planList = planDao.getPlanList(cri);
		result.memberList = memberDao.getMemberList(cri);
		
		return result;
		
	}
	
	// 통합검색결과 건수 조회 
	public long getTotalSearchNum(SearchCriteria cri) throws Exception{
		
		long result = 0;
		
		result += contentsDao.getTotalContentsNum(cri);
		result += planDao.getTotalPlanNum(cri);
		result += memberDao.getTotalMemberNum(cri);
		
		return result;
	}

}
