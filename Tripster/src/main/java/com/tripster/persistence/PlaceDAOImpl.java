package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.Criteria;
import com.tripster.domain.PlaceVO;

@Repository
public class PlaceDAOImpl implements PlaceDAO{
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.PlaceMapper";
	
	//관광지 상세 정보 조회
	@Override
	public PlaceVO read(Integer placeID) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".read", placeID);
	}
	
	//관광지 조회 회수 조회
	@Override
	public void updatePlaceViewCnt(Integer placeID) throws Exception {
		//쿼리 결과 반환
		session.update(namespace + ".updatePlaceViewCnt", placeID);
	}
	
	//관광지 리스트 조회
	@Override
	public List<PlaceVO> getPlaceList(Criteria cri) throws Exception {
		//쿼리 결과 반환
		return session.selectList(namespace + ".getPlaceList", cri);
	}
	
	//총 관광지 정보 개수 조회
	@Override
	public int getTotalPlaceNum(Criteria cri) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getTotalPlaceNum", cri);
	}
	
	//관광지 리뷰 개수 갱신
	@Override
	public void updatePlaceReviewCnt(Integer placeID, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("placeID", placeID);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updatePlaceReviewCnt", paramMap);
	};
}