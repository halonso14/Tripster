package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.PlanVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.PlanDAO;
import com.tripster.persistence.MemberDAO;

@Service
public class SearchResultServiceImpl implements SearchResultService {
	
	@Inject
	private ContentsDAO contentsDao;
	@Inject 
	private PlanDAO planDao;
	@Inject 
	private MemberDAO memberDao;
	
	@Override
	public List<ContentsVO> getRestaurantList(SearchCriteria cri) throws Exception{
		return contentsDao.getRestaurantList(cri);
	}
	
//	@Override
//	public List<PlanVO> myPlan(SearchCriteria cri) throws Exception{
//		return planDao.myPlan(cri);
//	}
//	@Override
//	public List<MemberVO> getMemberResultList(SearchCriteria cri) throws Exception{
//		return contentsDao.getMemberResultList(cri);
//	}
}
