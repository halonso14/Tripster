package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.Criteria;
import com.tripster.domain.RestaurantVO;

public interface RestaurantDAO {
	
	public RestaurantVO read(Integer restaurantID) throws Exception;
	
	//현재 페이지의 컨텐츠 목록 조회
	public List<RestaurantVO> showList(Criteria cri) throws Exception;
	
	//검색 구현 시 추가
}
