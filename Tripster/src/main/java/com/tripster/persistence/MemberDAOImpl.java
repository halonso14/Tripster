package com.tripster.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.tripster.mapper.MemberMapper";

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void insertMember(MemberVO vo) throws Exception {
		session.insert(namespace + ".insertMember", vo);
	}

	@Override
	public MemberVO repeatChk(String str) throws Exception {
		return session.selectOne(namespace + ".repeatChk", str);
	}

	@Override
	public MemberVO viewMember(Integer memberID) throws Exception {
		return session.selectOne(namespace + ".viewMember", memberID);
	}
}
