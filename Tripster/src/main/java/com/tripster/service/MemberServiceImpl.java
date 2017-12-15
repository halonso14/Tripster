package com.tripster.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;
import com.tripster.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {

		return dao.login(dto);
	}
	
	@Override
	public void keepLogin(String memberEmail, String sessionID, Date next) throws Exception{
		
		dao.keepLogin(memberEmail, sessionID, next);
	}
	
	public MemberVO checkLoginBefore(String value) {
		
		return dao.checkSessionKey(value);
	}

	@Override
	public void register(MemberVO vo) throws Exception {

		dao.insertMember(vo);
	}

	@Override
	public boolean repeatChk(String memberEmail) throws Exception {
		
		if (dao.repeatChk(memberEmail) == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public MemberVO viewMypage(String memberEmail) throws Exception {
		
		return dao.viewMember(memberEmail);
	}
	
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		
		dao.updateMember(vo);
	}
	
	@Override
	public void dropMember(String memberEmail) throws Exception {
		
		dao.deleteMember(memberEmail);
	}

}
