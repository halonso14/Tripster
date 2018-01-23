package com.tripster.service;

import java.util.*;
import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;
import com.tripster.persistence.EsContentsDAO;
import com.tripster.persistence.EsMemberDAO;
import com.tripster.persistence.EsPlanDAO;

@Service
public class EsSearchServiceimpl implements EsSearchService {
	
	@Inject
	private EsContentsDAO contentsDao;
	@Inject
	private EsPlanDAO planDao;
	@Inject
	private EsMemberDAO memberDao;
	
	// 통합검색결과 리스트 조회 
	@Override
	public EsSearchResult getTotalSearchList(SearchCriteria cri) throws Exception{
		
		EsSearchResult result = new EsSearchResult();
		
		result.contentsList = contentsDao.getContentsList(cri);
		result.planList = planDao.getPlanList(cri);
		result.memberList = memberDao.getMemberList(cri);
		
		return result;
		
	}
	
	// 통합검색결과 건수 조회 
	@Override
	public HashMap<String,String> getTotalSearchNum(SearchCriteria cri) throws Exception{
		
		HashMap<String,String> getNumbers = new HashMap<>();
		
		long result = 0;
		result += contentsDao.getTotalContentsNum(cri);
		result += planDao.getTotalPlanNum(cri);
		result += memberDao.getTotalMemberNum(cri);
		
		getNumbers.put("contentsNum", String.valueOf(contentsDao.getTotalContentsNum(cri)));
		getNumbers.put("planNum", String.valueOf(planDao.getTotalPlanNum(cri)));
		getNumbers.put("memberNum", String.valueOf(memberDao.getTotalMemberNum(cri)));
		getNumbers.put("totalNum", String.valueOf(result));
		
		return getNumbers;
		
	}


}