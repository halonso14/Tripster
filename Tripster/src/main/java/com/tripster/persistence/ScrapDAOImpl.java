package com.tripster.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.ScrapVO;

@Repository
public class ScrapDAOImpl implements ScrapDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "scrapMapper";
	
	// 스크랩 리스트 조회
	@Override
	public List<ScrapVO> listAll(Integer memberid) throws Exception {
		return session.selectList(namespace + ".listAll",memberid);
	}
	
	// 스크랩 추가
	@Override
	public void insert(ScrapVO vo) throws Exception{
		session.insert(namespace+".scrap",vo);
	}
	
	// 스크렙 리스트에서 스크랩 삭제
	@Override
	public void scrapIDRemove(Integer scrapID) throws Exception{
		session.delete(namespace+".scrapIDRemove",scrapID);
	}
	
	// 컨텐츠 조회
	@Override
	public ContentsVO read(Integer id) throws Exception{
		return session.selectOne(namespace+".read",id);
	}
	
	// 컨텐츠에서 스크랩 삭제
	@Override
	public void contentsScrapDelete(Integer contentsID) throws Exception{
		session.delete(namespace+".contentsScrapDelete",contentsID);
	}

}
