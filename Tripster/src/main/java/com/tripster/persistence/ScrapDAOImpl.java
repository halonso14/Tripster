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
	
	@Override
	public List<ScrapVO> listAll(Integer memberid) throws Exception {
		return session.selectList(namespace + ".listAll",memberid);
	}
	
	@Override
	public void insert(ScrapVO vo) throws Exception{
		session.insert(namespace+".scrap",vo);
	}
	
	public void delete(Integer scrapID) throws Exception{
		session.delete(namespace+".delete",scrapID);
	}
	
	@Override
	public ContentsVO read(Integer id) throws Exception{
		return session.selectOne(namespace+".read",id);
	}

}
