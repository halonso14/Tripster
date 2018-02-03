package com.tripster.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.Criteria;
import com.tripster.domain.EsPlanVO;
import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.FollowVO;
import com.tripster.domain.LikeVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.persistence.EsContentsDAO;
import com.tripster.persistence.EsMemberDAO;
import com.tripster.persistence.EsPlanDAO;
import com.tripster.persistence.LikeDAO;

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
	public EsSearchResultVO getTotalSearchList(SearchCriteria cri) throws Exception{
		
		// 조회결과 담을 result변수 선언.
		EsSearchResultVO result = new EsSearchResultVO();
		
		// 컨텐츠-일정-회원 dao실행결과 변수에 각각 담아두기. 통합검색은 10건씩 조회 
		EsSearchResultVO contents = contentsDao.getContentsList(cri,10); 
		EsSearchResultVO plan = planDao.getPlanList(cri,10);
		EsSearchResultVO member = memberDao.getMemberList(cri,10);
		
		// result에 dao실행결과 담기 
		result.setContentsList(contents.getContentsList());
		result.setContentsCnt(contents.getContentsCnt());
		result.setPlanList(plan.getPlanList());
		result.setPlanCnt(plan.getPlanCnt());
		result.setMemberList(member.getMemberList());
		result.setMemberCnt(member.getMemberCnt());	
		result.setTotalCnt(contents.getContentsCnt()+plan.getPlanCnt()+member.getMemberCnt());
		return result;
	}

	
	// 컨텐츠 검색결과 더보기 리스트 조회 
	public EsSearchResultVO getContentsSearchList(SearchCriteria cri) throws Exception{
		
		// 조회결과 담을 result변수 선언.
		EsSearchResultVO result = new EsSearchResultVO();
		
		// 컨텐츠 dao실행결과 변수에 담아두기. 상세검색은 500건씩 조회 
		EsSearchResultVO contents = contentsDao.getContentsList(cri,500);
		
		// result에 dao실행결과 담기 
		result.setContentsList(contents.getContentsList());
		result.setContentsCnt(contents.getContentsCnt());
		return result;
	}

	
	// 일정 검색결과 더보기 리스트 조회 
	public EsSearchResultVO getPlanSearchList(SearchCriteria cri) throws Exception{
		
		// 조회결과 담을 result변수 선언.
		EsSearchResultVO result = new EsSearchResultVO();
		
		// 일정 dao실행결과 변수에 담아두기. 상세검색은 500건씩 조회 
		EsSearchResultVO plan = planDao.getPlanList(cri,500);
		
		// result에 dao실행결과 담기 
		result.setPlanList(plan.getPlanList());
		result.setPlanCnt(plan.getPlanCnt());
		return result;		
	}

	
	// 회원 검색결과 더보기 리스트 조회 
	public EsSearchResultVO getMemberSearchList(SearchCriteria cri) throws Exception{
		
		// 조회결과 담을 result변수 선언.
		EsSearchResultVO result = new EsSearchResultVO();
		
		// 회원 dao실행결과 변수에 담아두기. 상세검색은 500건씩 조회 
		EsSearchResultVO member = memberDao.getMemberList(cri,500);
		
		// result에 dao실행결과 담기 
		result.setMemberList(member.getMemberList());
		result.setMemberCnt(member.getMemberCnt());	
		return result;
	}

}