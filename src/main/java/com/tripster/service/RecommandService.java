package com.tripster.service;

import java.util.List;

import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashCountryVO;
import com.tripster.domain.DashDetailVO;
import com.tripster.domain.DashLikeVO;
import com.tripster.domain.PlanVO;
import com.tripster.domain.RcmPlanVO;

public interface RecommandService {

	//유저 일정별 디테일정보
	public List<RcmPlanVO> getPlanList(String countryISO2) throws Exception;
	
}