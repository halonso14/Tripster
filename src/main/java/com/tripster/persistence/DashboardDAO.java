package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashboardVO;

public interface DashboardDAO {
	
	//플랜별 여행일수, 들른 나라, 플랜갯수 등의 나의 플랜 정보
	public DashBriefVO getPlanInfo(Integer memberID) throws Exception;
		
	//맛집 리스트 조회
	//public List<DashboardVO> getRestaurantList(Criteria cri) throws Exception;



}
