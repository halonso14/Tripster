package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;

@Repository
public class ContentsDAOImpl implements ContentsDAO{
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.ContentsMapper";
	
	//컨텐츠 상세 정보 조회
	@Override
	public ContentsVO read(Integer contentsID) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".read", contentsID);
	}
	
	//컨텐츠 조회 회수 조회
	@Override
	public void updateContentsViewCnt(Integer contentsID) throws Exception {
		//쿼리 결과 반환
		session.update(namespace + ".updateContentsViewCnt", contentsID);
	}
	
	//컨텐츠 리스트 조회
	@Override
	public List<ContentsVO> getContentsList(Criteria cri) throws Exception {
		//쿼리 결과 반환
		return session.selectList(namespace + ".getContentsList", cri);
	}
	
	//총 컨텐츠 정보 개수 조회
	@Override
	public int getTotalContentsNum(Criteria cri) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getTotalContentsNum", cri);
	}
	
	//컨텐츠 리뷰 개수 갱신
	@Override
	public void updateContentsReviewCnt(Integer contentsID, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("contentsID", contentsID);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateContentsReviewCnt", paramMap);
	}
	
	//컨텐츠 스크랩 개수 갱신
	@Override
	public void updateContentsScrapCnt(Integer contentsID, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("contentsID", contentsID);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateContentsScrapCnt", paramMap);
	};
}