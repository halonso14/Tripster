package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.MemberVO;
import com.tripster.persistence.LikeDAO;
import com.tripster.persistence.PlanDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class LikeDAOTest {

	@Inject
	LikeDAO dao;
	
	@Inject
	PlanDAO planDAO;
	
//	@Test
//	public void like()throws Exception {
//		LikeVO vo = new LikeVO();
//		vo.setMemberID(1);
//		vo.setPlanID(2);
//		dao.like(vo);
//	}
	
//	@Test
//	public void planList() throws Exception{
////		PlanVO userPlan = dao.userSchedule(1, 1);
////		System.out.println(userPlan.toString());
//		
//	}
	
//	@Test
//	public void memberFollow() throws Exception{
//
//		dao.memberFollow(1, 3);
//		
//	}
	
//	@Test
//	public void memberFollowDelete() throws Exception{
//		dao.memberFollowDelete(1, 1);
//		
//	}
	
//	@Test
//	public void memberFollowCheck() throws Exception{
//		// 유저의 리스트 조회
//		List<FollowVO> list = dao.memberFollowList(1);
//		System.out.println("test:!!"+list.toString());
//		Integer memberID = planDAO.selectPlan(2).getMemberID();
//		for(int i=0;i<list.size();i++) {
//			if(memberID == list.get(i).getFollowID()) {
//				System.out.println("있음");
//				break;
//			}
//		}
//		System.out.println("없음");
//	}
	
//	@Test
//	public void likeList() throws Exception{
//		
//		// 멤버1 의 좋아요 리스트
////		List<LikeVO> likelist = dao.likeList(1);
////		List<PlanVO> planlist = new ArrayList<>();
////		System.out.println(likelist.toString());
////		for(int i=0;i<likelist.size();i++) {
////			planlist.add(dao.userSchedule(likelist.get(i).getPlanID()));
////		}
////		System.out.println(planlist.toString());
//		List<PlanVO> planlist= dao.userLikeList(1);
//		System.out.println(planlist.toString());
//
//	}
	
	@Test
	public void followList() throws Exception{
		
		List<MemberVO> list = dao.userFollowList(1);
		System.out.println(list.toString());
		
	}

}
