package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashCountryVO;
import com.tripster.domain.DashDetailVO;
import com.tripster.domain.DashLikeVO;
import com.tripster.persistence.DashboardDAO;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Inject 
	private DashboardDAO dao;
	
	//맛집 상세 정보 조회
	@Transactional
	@Override
	public DashBriefVO getPlanBriefInfo(Integer memberID) throws Exception {
		//조회수 추가
		return dao.getPlanBriefInfo(memberID);
	}

	@Override
	public List<DashDetailVO> getPlanDetailInfo(Integer memberID) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPlanDetailInfo(memberID);
	}

	@Override
	public List<DashLikeVO> getPlanLikeInfo(Integer memberID) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPlanLikeInfo(memberID);
	}

	@Override
	public List<DashCountryVO> getPlanCountryInfo(Integer memberID) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPlanCountryInfo(memberID);
	}


}