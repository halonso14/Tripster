package com.tripster.service;

import java.util.List;

import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashCountryVO;
import com.tripster.domain.DashDetailVO;
import com.tripster.domain.DashLikeVO;

public interface DashboardService {
	//맛집 상세 정보 조회
	public DashBriefVO getPlanBriefInfo(Integer memberID) throws Exception;
	
	//유저 일정별 디테일정보
	public List<DashDetailVO> getPlanDetailInfo(Integer memberID) throws Exception;

	//유저 일정별 좋아요정보
	public List<DashLikeVO> getPlanLikeInfo(Integer memberID) throws Exception;

	//유저 일정별 좋아요정보
	public List<DashCountryVO> getPlanCountryInfo(Integer memberID) throws Exception;
	
}