package com.tripster.service;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

public interface MemberService {

	public MemberVO login(LoginDTO dto) throws Exception;

	public void register(MemberVO vo) throws Exception;

	public String repeatChk(String str) throws Exception;
	
	public MemberVO viewMypage(Integer memberID) throws Exception;
}
