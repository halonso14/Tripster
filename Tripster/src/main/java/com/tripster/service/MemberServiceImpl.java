package com.tripster.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;
import com.tripster.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO dao;
	
	@Override
	public MemberVO login(LoginDTO dto) throws Exception{
		return dao.login(dto);
	}
}
