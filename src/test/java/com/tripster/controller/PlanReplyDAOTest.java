package com.tripster.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.PlanReplyVO;
import com.tripster.persistence.PlanReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class PlanReplyDAOTest {
	@Inject
	private PlanReplyDAO planReplyDAO;
	
//	@Test
//	public void insert() throws Exception {
//		PlanReplyVO vo = new PlanReplyVO();
//		vo.setPlanID(2);
//		vo.setMemberID(1);
//		vo.setPlanReplyContents("댓글이다3");
//		
//		planReplyDAO.register(vo);
//	}
	
//	@Test
//	public void update()throws Exception{
//		PlanReplyVO vo = new PlanReplyVO();
//		
//		vo.setPlanReplyID(2);
//		vo.setPlanReplyContents("수정했땅.");
//	
//		planReplyDAO.update(vo);
//	}
	
//	@Test
//	public void select()throws Exception{
//		System.out.println(planReplyDAO.list(2));
//	}

	@Test
	public void delete()throws Exception{
		planReplyDAO.delete(4);
	}
}
