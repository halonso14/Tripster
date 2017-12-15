package com.tripster.service;

import java.util.Date;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

public interface MemberService {

	public MemberVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String memberEmail, String sessionID, Date next) throws Exception;
	
	public MemberVO checkLoginBefore(String value);

	public void register(MemberVO vo) throws Exception;

	public boolean repeatChk(String memberEmail) throws Exception;
	
	public MemberVO viewMypage(String memberEmail) throws Exception;
	
	public void updateMember(MemberVO vo) throws Exception;
	
	public void dropMember(String memberEmail) throws Exception;
}
