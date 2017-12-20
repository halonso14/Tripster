package com.tripster.service;

import java.util.List;

import com.tripster.domain.DashBriefVO;

public interface DashboardService {
	//맛집 상세 정보 조회
	public DashBriefVO getPlanInfo(Integer memberID) throws Exception;
	//맛집 리스트 조회
	//public List<ContentsVO> getRestaurantList(Criteria cri) throws Exception;
		
	
}