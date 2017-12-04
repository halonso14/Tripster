package com.tripster.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.tripster.mapper.MemberMapper";
	
	@Override
	public MemberVO login(LoginDTO dto)throws Exception{
		return session.selectOne(namespace + ".login", dto);
	}
}
