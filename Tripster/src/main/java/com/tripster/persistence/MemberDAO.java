package com.tripster.persistence;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

public interface MemberDAO {

	public MemberVO login(LoginDTO dto) throws Exception;

	public void insertMember(MemberVO vo) throws Exception;

	public MemberVO repeatChk(String str) throws Exception;

	public MemberVO viewMember(Integer memberID) throws Exception;
}
