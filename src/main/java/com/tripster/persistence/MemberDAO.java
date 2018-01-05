package com.tripster.persistence;

import java.util.Date;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

public interface MemberDAO {

	public MemberVO login(LoginDTO dto) throws Exception;
	
	public MemberVO getMemberPw(String memberEmail) throws Exception;
	
	public void keepLogin(Integer memberID, String sessionKey, Date next);
	
	public MemberVO checkSessionKey(String value);

	public void insertMember(MemberVO vo) throws Exception;
	
	public void createAuthKey(String memberEmail, String memberAuthKey) throws Exception;
	
	public void authMember(String memberEmail) throws Exception;
	
	public void createTempPassword(String memberEmail, String memberPassword) throws Exception;

	public MemberVO repeatChk(String memberEmail) throws Exception;

	public MemberVO mypage(Integer memberID) throws Exception;
	
	public MemberVO changeProfile(MemberVO vo) throws Exception;
	
	public MemberVO changePassword(MemberVO vo) throws Exception;
	
	public void uploadPicture(MemberVO vo) throws Exception;
	
	public void deleteMember(Integer memberID) throws Exception;
}