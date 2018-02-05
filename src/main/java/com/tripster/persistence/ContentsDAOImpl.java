package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;
import com.tripster.domain.EsContentsVO;

@Repository
public class ContentsDAOImpl implements ContentsDAO{
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.contentsMapper";
	
	//컨텐츠 상세 정보 조회
	@Override
	public ContentsVO getContentsDetail(Integer contentsID) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getContentsDetail", contentsID);
	}
	
	//총 맛집 정보 개수 조회
	@Override
	public int getTotalRestaurantNum(Criteria cri) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getTotalRestaurantNum", cri);
	}
		
	//총 관광지 정보 개수 조회
	@Override
	public int getTotalPlaceNum(Criteria cri) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getTotalPlaceNum", cri);
	}
	
	//컨텐츠 조회 회수 조회
	@Override
	public void updateViewCnt(Integer contentsID) throws Exception {
		//쿼리 결과 반환
		session.update(namespace + ".updateViewCnt", contentsID);
	}
	
	//컨텐츠 리뷰 개수 갱신
	@Override
	public void updateReviewCnt(Integer contentsID, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("contentsID", contentsID);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateReviewCnt", paramMap);
	}
	
	//컨텐츠 스크랩 개수 갱신
	@Override
	public void updateScrapCnt(Integer contentsID, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("contentsID", contentsID);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateScrapCnt", paramMap);
	};
	
	//컨텐츠 평점 갱신
	@Override
	public void updateContentsRating(Integer contentsID, double contentsRating) throws Exception{
		HashMap<String, Double> map = new HashMap<>();
		map.put("contentsID",(double)contentsID);
		map.put("contentsRating", contentsRating);
		session.insert(namespace+".updateContentsRating",map);
	}
	
	//컨텐츠 스크랩 카운트 조회
	@Override
	public Integer getScrapCnt(Integer contentsID)throws Exception{
		return session.selectOne(namespace+".getScrapCnt",contentsID);
	}

	//검색결과 컨텐츠의 플랜 카운트 리스트 (검색 페이지에서 사용 )
	@Override
	public List<EsContentsVO> getPlanCntList() throws Exception{
		return session.selectList(namespace+".getPlanCntList");
	}
	
	//검색결과 컨텐츠의 플랜 카운트 리스트 (검색 페이지에서 사용 )
	@Override
	public List<EsContentsVO> getReviewCntList() throws Exception{
		return session.selectList(namespace+".getReviewCntList");
	}
	
	//검색결과 컨텐츠의 스크랩 카운트 리스트(검색 페이지에서 사용 ) 
	@Override
	public List<EsContentsVO> getScrapCntList() throws Exception{
		return session.selectList(namespace+".getScrapCntList");
	}

}