package com.tripster.controller;

import java.util.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.PlanVO;
import com.tripster.persistence.PlanDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class PlanDAOTest {

	@Inject
	private PlanDAO planDAO;
	
//	@Test
//	public void createPlan() throws Exception{
//		PlanVO planVO = new PlanVO();
//		planVO.setPlanID(0);
//		planVO.setMemberID(1);
//		planVO.setPlanTitle("과");
//		planVO.setPlanStartDate(new Date());
//		planVO.setPlanEndDate(new Date());
//		
//		planDAO.insertPlan(planVO);
//	}
//	
//	@Test
//	public void updatePlan()throws Exception{
//		PlanVO planVO = new PlanVO();
//		planVO.setPlanID(3);
//		planVO.setPlanTitle("수정했지롱.");
//		planVO.setPlanStartDate(new Date());
//		planVO.setPlanEndDate(new Date());
//		
//		planDAO.updatePlan(planVO);
//	}

	
//	@Test
//	public void selectPlan()throws Exception{
//		System.out.println(planDAO.selectPlan(3));
//		
//	}
//	
//	@Test
//	public void deletePlan()throws Exception{
//		planDAO.deletePlan(3);
//	}
	
	@Test
	public void selectPlanID()throws Exception{
		System.out.println(planDAO.selectLastPlanID());
	}
}
