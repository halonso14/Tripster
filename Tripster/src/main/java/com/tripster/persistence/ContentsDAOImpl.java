package com.tripster.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.ContentsVO;

@Repository
public class ContentsDAOImpl implements ContentsDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "contentsMapper";
	
	@Override
	public ContentsVO read(Integer id) throws Exception{
		return session.selectOne(namespace+".read",id);
	}
	
	
	

}
