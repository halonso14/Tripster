package com.tripster.controller;

import java.util.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;
import com.tripster.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MemberDAOTest {

	@Inject
	private MemberDAO dao;
	private LoginDTO dto;
	
//	@Test
//	public void testTime()throws Exception{
//		System.out.println(dao.login(dto));
//	}
//	
//	@Test
//	public void testInsertMember()throws Exception{
//		
//		Date date = new Date();
//		
//		MemberVO vo = new MemberVO();
//		vo.setMemberEmail("kevin@korea.ac.kr");
//		vo.setMemberPassword("12341111");
//		vo.setMemberName("왜안돼");
//		vo.setMemberBirthday(date);
//		
//		dao.insertMember(vo);
//		
//	}
	
	@Test
	public void testUpdateMember()throws Exception{
		
		Date date = new Date();
		
		MemberVO vo = new MemberVO();
		vo.setMemberEmail("kevin0310@korea.ac.kr");
		vo.setMemberPassword("1234");
		vo.setMemberName("후추선생님");
		vo.setMemberBirthday(date);
		
		dao.updateMember(vo);
	}
}
