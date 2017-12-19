package com.tripster.persistence;

import java.util.Date;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

public interface MemberDAO {

	public MemberVO login(LoginDTO dto) throws Exception;
	
	public MemberVO getMemberPw(String memberEmail) throws Exception;
	
	public void keepLogin(String memberEmail, String sessionID, Date next);
	
	public MemberVO checkSessionKey(String value);

	public void insertMember(MemberVO vo) throws Exception;
	
	public void createAuthKey(String memberEmail, String memberAuthCode) throws Exception;
	
	public void authMember(String memberEmail) throws Exception;
	
	public void createTempPassword(String memberEmail, String memberPassword) throws Exception;

	public MemberVO repeatChk(String memberEmail) throws Exception;

	public MemberVO viewMember(String memberEmail) throws Exception;
	
	public void updateMember(MemberVO vo) throws Exception;
	
	public void deleteMember(String memberEmail) throws Exception;
}
