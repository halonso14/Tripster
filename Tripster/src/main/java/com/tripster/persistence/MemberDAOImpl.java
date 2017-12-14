package com.tripster.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
	public void keepLogin(String memberEmail, String sessionID, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberEmail", memberEmail);
		paramMap.put("sessionID", sessionID);
		paramMap.put("next", next);

		session.update(namespace + ".keepLogin", paramMap);
	}

	@Override
	public MemberVO checkSessionKey(String value) {
		return session.selectOne(namespace + ".checkSessionKey", value);
	}

	@Override
	public void insertMember(MemberVO vo) throws Exception {
		session.insert(namespace + ".insertMember", vo);
	}

	@Override
	public MemberVO repeatChk(String memberEmail) throws Exception {
		return session.selectOne(namespace + ".repeatChk", memberEmail);
	}

	@Override
	public MemberVO viewMember(String memberEmail) throws Exception {
		return session.selectOne(namespace + ".viewMember", memberEmail);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		session.selectOne(namespace + ".updateMember", vo);
	}

	@Override
	public void deleteMember(String memberEmail) throws Exception {
		session.selectOne(namespace + ".deleteMember", memberEmail);
	}
}
