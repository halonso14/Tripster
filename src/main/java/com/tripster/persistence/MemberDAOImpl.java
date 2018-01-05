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
	public MemberVO getMemberPw(String memberEmail) throws Exception {
		return session.selectOne(namespace + ".getPassword", memberEmail);
	}

	@Override
	public void keepLogin(Integer memberID, String sessionKey, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberID", memberID);
		paramMap.put("sessionKey", sessionKey);
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
	public void createAuthKey(String memberEmail, String memberAuthKey) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMemberEmail(memberEmail);
		vo.setMemberAuthKey(memberAuthKey);
		
		session.selectOne(namespace + ".authMember", vo);
	}
	
	@Override
	public void authMember(String memberEmail) throws Exception {
		session.update(namespace + ".authMember", memberEmail);
	}
	
	@Override
	public void createTempPassword(String memberEmail, String tempPassword) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMemberEmail(memberEmail);
		vo.setMemberPassword(tempPassword);
		
		session.update(namespace + ".createTempPassword", vo);
	}

	@Override
	public MemberVO repeatChk(String memberEmail) throws Exception {
		return session.selectOne(namespace + ".repeatChk", memberEmail);
	}
	
	@Override
	public MemberVO mypage(Integer memberID) throws Exception {
		return session.selectOne(namespace + ".mypage", memberID);
	}
	
	@Override
	public MemberVO changeProfile(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".changeProfile", vo);
	}
	
	@Override
	public MemberVO changePassword(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".changePassword", vo);
	}
		
	@Override
	public void uploadPicture(MemberVO vo) throws Exception {
		session.insert(namespace + ".uploadPicture", vo);
	}

	@Override
	public void deleteMember(Integer memberID) throws Exception {
		session.selectOne(namespace + ".deleteMember", memberID);
	}
}