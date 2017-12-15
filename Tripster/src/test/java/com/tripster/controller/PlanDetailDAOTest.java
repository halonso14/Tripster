package com.tripster.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.PlanDetailVO;
import com.tripster.service.PlanDetailService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class PlanDetailDAOTest {
	
	@Inject
	private PlanDetailService planDetailService;
//
//	@Test
//	public void insert() throws Exception {
//		PlanDetailVO vo = new PlanDetailVO();
//		vo.setPlanDetailID(0);
//		vo.setPlanID(2);
//		vo.setTitle("툭툭누들타이333333333");
//		vo.setTitle("타이틀2222222");
//		vo.setPlanDetailStartTime("12:00:00");
//		vo.setPlanDetailDate("2017-12-13");
//		vo.setCodeID(1);
//		
//		planDetailService.registerPlanDetail(vo);
//	}
//	
	
//	@Test
//	public void modify() throws Exception {
//		PlanDetailVO vo = new PlanDetailVO();
//		vo.setPlanDetailID(3);
//		vo.setPlanDetailStartTime("17:00:00");
//		vo.setPlanDetailDate("2017-12-15");
//		vo.setCodeID(1);
//		
//		Map<String, Object> map = new HashMap();
//		
//		map.put("planDetailID",4);
//		map.put("planDetailStartTime","23:00:00");
//		planDetailService.modifyPlanDetail(map);
//	}
//	
	
//	@Test
//	public void selectAll()throws Exception{
//		System.out.println(planDetailService.readAllPlanDetail(52));
//		
//	}
	

//	@Test
//	public void delete() {
//		int id = 3;
//		planDetailDAO.deletePlanDetail(3);
//	}
	
//	@Test
//	public void selectAll() {
//		int id = 1;
//		List<PlanDetailVO> list = planDetailDAO.selectAllByPlanID(1);
//	}
//	
//	@Test
//	public void deleteAll() {
//		int id = 1;
//		planDetailDAO.deleteAllByPlanID(id);
//	}
}
