package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.DashBriefVO;
import com.tripster.persistence.DashboardDAO;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Inject 
	private DashboardDAO dao;
	
	//맛집 상세 정보 조회
	@Transactional
	@Override
	public DashBriefVO getPlanInfo(Integer memberID) throws Exception {
		//조회수 추가
		return dao.getPlanInfo(memberID);
	}

	
	//맛집 리스트 조회
	/*@Override
	public List<ContentsVO> getRestaurantList(Criteria cri) throws Exception {
		return dao.getRestaurantList(cri);
	}
	 */
}