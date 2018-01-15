package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.ScrapVO;

@Repository
public class ScrapDAOImpl implements ScrapDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "scrapMapper";
	
	// 스크랩 추가
	@Override
	public void create(Integer memberID,Integer contentsID) throws Exception{
		Map<String,Integer> map = new HashMap<>();
		map.put("memberID", memberID);
		map.put("contentsID", contentsID);
		session.insert(namespace+".scrap",map);
	}
	
	// 스크랩 삭제
	@Override
	public void scrapDelete(Integer contentsID) throws Exception{
		session.delete(namespace+".scrapDelete",contentsID);
	}
	
	// 스크랩리스트 조회
	@Override
	public List<ScrapVO> listAll(Integer memberID) throws Exception {
		return session.selectList(namespace + ".listAll",memberID);
	}
	
	// 컨텐츠에서 스크랩 삭제
	@Override
	public void scrapIDRemove(Integer contentsID) throws Exception{
		session.delete(namespace+".scrapIDRemove",contentsID);
	}

}
