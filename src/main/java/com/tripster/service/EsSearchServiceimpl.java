package com.tripster.service;

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
	
	// 통합 검색결과 리스트 조회 
	@Override
	public EsSearchResult getTotalSearchList(SearchCriteria cri) throws Exception{
		
		// 조회결과 담을 result변수 선언.
		EsSearchResult result = new EsSearchResult();
		
		// 컨텐츠-일정-회원 dao실행결과 변수에 각각 담아두기. 통합검색은 10건씩 조회 
		EsSearchResult contents = contentsDao.getContentsList(cri,10); 
		EsSearchResult plan = planDao.getPlanList(cri,10);
		EsSearchResult member = memberDao.getMemberList(cri,10);
		
		// result에 dao실행결과 담기 
		result.setContentsList(contents.getContentsList());
		result.setContestsCnt(contents.getContestsCnt());
		result.setPlanList(plan.getPlanList());
		result.setPlanCnt(plan.getPlanCnt());
		result.setMemberList(member.getMemberList());
		result.setMemberCnt(member.getMemberCnt());	
		result.setTotalCnt(contents.getContestsCnt()+plan.getPlanCnt()+member.getMemberCnt());
		return result;
	}

	
	// 컨텐츠 검색결과 더보기 리스트 조회 
	public EsSearchResult getContentsSearchList(SearchCriteria cri) throws Exception{
		
		// 조회결과 담을 result변수 선언.
		EsSearchResult result = new EsSearchResult();
		
		// 컨텐츠 dao실행결과 변수에 담아두기. 상세검색은 500건씩 조회 
		EsSearchResult contents = contentsDao.getContentsList(cri,500);
		
		// result에 dao실행결과 담기 
		result.setContentsList(contents.getContentsList());
		result.setContestsCnt(contents.getContestsCnt());
		return result;
	}

	
	// 일정 검색결과 더보기 리스트 조회 
	public EsSearchResult getPlanSearchList(SearchCriteria cri) throws Exception{
		
		// 조회결과 담을 result변수 선언.
		EsSearchResult result = new EsSearchResult();
		
		// 일정 dao실행결과 변수에 담아두기. 상세검색은 500건씩 조회 
		EsSearchResult plan = planDao.getPlanList(cri,500);
		
		// result에 dao실행결과 담기 
		result.setPlanList(plan.getPlanList());
		result.setPlanCnt(plan.getPlanCnt());
		return result;		
	}

	
	// 회원 검색결과 더보기 리스트 조회 
	public EsSearchResult getMemberSearchList(SearchCriteria cri) throws Exception{
		
		// 조회결과 담을 result변수 선언.
		EsSearchResult result = new EsSearchResult();
		
		// 회원 dao실행결과 변수에 담아두기. 상세검색은 500건씩 조회 
		EsSearchResult member = memberDao.getMemberList(cri,500);
		
		// result에 dao실행결과 담기 
		result.setMemberList(member.getMemberList());
		result.setMemberCnt(member.getMemberCnt());	
		return result;
	}

}