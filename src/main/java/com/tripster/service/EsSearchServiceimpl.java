package com.tripster.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.EsContentsVO;
import com.tripster.domain.EsMemberVO;
import com.tripster.domain.EsPlanVO;
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
	
	// 컨텐츠 페이지 처리
	@Override
	public List<EsContentsVO> contentsList(SearchCriteria cri) throws Exception{
		
		List<EsContentsVO> contentsList = contentsDao.getContentsList(cri);
		System.out.println("contentsSize:"+contentsList.size());
		List<EsContentsVO> result = new ArrayList<>();
		if(contentsList.size() > 10) {
			for(int i=cri.getPageStart();i<cri.getPage()*cri.getPerPageNum();i++) {
				result.add(contentsList.get(i));
			}
		}else {
			result = contentsList;
		}
		System.out.println("contentsList"+result.toString());
		return result;
		
	}
	
	// 플랜 페이지 처리
	@Override
	public List<EsPlanVO> planList(SearchCriteria cri) throws Exception{
		
		List<EsPlanVO> planList = planDao.getPlanList(cri);
		List<EsPlanVO> result = new ArrayList<>();
		if(planList.size() > 10) {
			for(int i=cri.getPageStart();i<cri.getPage()*cri.getPerPageNum();i++) {
				result.add(planList.get(i));
			}
		}else {
			result = planList;
		}
		System.out.println("contentsList"+result.toString());
		return result;
		
	}
	
	// 멤버 페이지 처리
	@Override
	public List<EsMemberVO> memberList(SearchCriteria cri) throws Exception{
		
		List<EsMemberVO> memberList = memberDao.getMemberList(cri);
		List<EsMemberVO> result = new ArrayList<>();
		if(memberList.size() > 10) {
			for(int i=cri.getPageStart();i<cri.getPage()*cri.getPerPageNum();i++) {
				result.add(memberList.get(i));
			}
		}else {
			result = memberList;
		}
		System.out.println("contentsList"+result.toString());
		return result;
		
	}

}
