package com.Tripster.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.Tripster.domain.ScrapVO;

@Repository
public class ScrapDAOImpl implements ScrapDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "ScrapMapper";
	
	@Override
	public void create(ScrapVO vo) throws Exception{
		session.insert(namespace+".create",vo);
	}

}
