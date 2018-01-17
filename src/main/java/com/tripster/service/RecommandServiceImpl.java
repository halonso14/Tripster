package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashCountryVO;
import com.tripster.domain.DashDetailVO;
import com.tripster.domain.DashLikeVO;
import com.tripster.domain.PlanVO;
import com.tripster.domain.RcmPlanVO;
import com.tripster.persistence.DashboardDAO;
import com.tripster.persistence.RecommandDAO;

@Service
public class RecommandServiceImpl implements RecommandService{
	
	@Inject 
	private RecommandDAO dao;
	
	//맛집 상세 정보 조회
	@Transactional
	@Override
	public List<RcmPlanVO> getPlanList(String countryISO2) throws Exception {
		//조회수 추가
		return dao.getPlanList(countryISO2);
	}


}