package com.tripster.service;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;

public interface MemberService {

	public MemberVO login(LoginDTO dto) throws Exception;
}
