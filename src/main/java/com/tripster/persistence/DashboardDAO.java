package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.DashBriefVO;
import com.tripster.domain.DashCountryVO;
import com.tripster.domain.DashDetailVO;
import com.tripster.domain.DashLikeVO;
import com.tripster.domain.DashboardVO;

public interface DashboardDAO {
	
	//유저 일정 간략정보
	public DashBriefVO getPlanBriefInfo(Integer memberID) throws Exception;

	//유저 일정별 디테일정보
	public List<DashDetailVO> getPlanDetailInfo(Integer memberID) throws Exception;

	//유저 일정별 좋아요정보
	public List<DashLikeVO> getPlanLikeInfo(Integer memberID) throws Exception;
	
	//유저 다녀온 국가 정보
	public List<DashCountryVO> getPlanCountryInfo(Integer memberID) throws Exception;



}
