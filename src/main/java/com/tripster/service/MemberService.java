package com.tripster.service;

import java.util.Date;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

public interface MemberService {

	public MemberVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(Integer memberID, String sessionKey, Date next) throws Exception;
	
	public MemberVO checkLoginBefore(String value);

	public void register(MemberVO vo) throws Exception;
	
	public void authMember(String memberEmail) throws Exception;
	
	public void findPassword(MemberVO vo) throws Exception;

	public boolean repeatChk(String memberEmail) throws Exception;
	
	public MemberVO mypage(Integer memberID) throws Exception;
	
	public void changeProfile(MemberVO vo) throws Exception;
	
	public void changePassword(MemberVO vo) throws Exception;
	
	public boolean passwordChk(MemberVO vo) throws Exception;
	
	public void uploadPicture(MemberVO vo) throws Exception;
	
	public void dropMember(Integer memberID) throws Exception;
}