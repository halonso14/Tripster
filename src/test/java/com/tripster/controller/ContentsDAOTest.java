package com.tripster.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.tripster.domain.Criteria;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.ContentsReviewDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ContentsDAOTest {

	@Inject
	private ContentsDAO dao;
	@Inject
	private ContentsReviewDAO reviewdao;
	
	Criteria cri = new Criteria();
	
	//컨텐츠 상세 정보 검색 / 조회수 갱신 테스트
	@Test
	public void testRead() throws Exception {
		
		try {
			
			ObjectMapper mapper = new ObjectMapper();
			String rawData = dao.getRestaurantDetail(60000).getContents();
			String data = rawData.replaceAll("'", "\"");
			Collection<Map<String,Object>> readValues = new ObjectMapper().readValue(data, new TypeReference<Collection<Map<String,Object>>>(){});
			Object[] dataList = readValues.toArray();
			Map<String,String> contentsURL = (Map<String,String>)dataList[0];
			Map<String,String> contentsHomePage = (Map<String,String>)dataList[1];
			Map<String,List<Object>> outer = (Map<String,List<Object>>)dataList[2];
			List<Object> reviewList = (List<Object>)outer.get("review");
			
			System.out.println(data.toString());
			System.out.println(reviewList.toString());
			}catch (JsonGenerationException e) { 
				e.printStackTrace(); 
			}catch (JsonMappingException e) { 
				e.printStackTrace(); 
			}catch (IOException e) { 
				e.printStackTrace(); 
			}
	}
//	
//	//컨텐츠 리스트 조회 테스트
//	@Test
//	public void testGetContentsList() throws Exception {
//		cri.setCurPage(1);
//		cri.setContentsPerPage(5);
//		List<ContentsVO> list = dao.getContentsList(cri);
//		for(int i = 0; i < list.size(); i++) {
//			System.out.println(list.get(i).toString());
//		}
//	}
//	
//	//총 컨텐츠 정보 수 조회 테스트
//	@Test
//	public void testGetTotalContentsNum() throws Exception {
//		System.out.println(dao.getTotalContentsNum(cri));
//	}
	
//	@Test
//	public void textContentsVO() throws Exception {
//		
//		System.out.println(dao.getRestaurantDetail().toString());
//	}
	
//	@Test
//	public void RatingTest() throws Exception{
//		//컨텐츠의 평점 넣기
//		List<ContentsReviewVO> list = reviewdao.getReviewList(1, new Criteria());
//		Integer contentsRating = 0;
//		Integer sum = 0;
//		for(int i=0;i<list.size();i++) {
//			sum += list.get(i).getRanking();
//		};
//		contentsRating = sum/list.size();
//		System.out.println(contentsRating);
//		dao.updateContentsRating(contentsRating,1);
//	}
	
//	
//	@Inject
//	private RecommandDAO recommandDAO;
//	
//	//컨텐츠 상세 정보 검색 / 조회수 갱신 테스트
//	@Test
//	public void testRead() throws Exception {
//		
//		List<PlanVO> planVO = recommandDAO.getPlanList("AU");
//		PlanVO el = planVO.get(0);
//		SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
//		System.out.println(dt1.format(el.getPlanStartDate()));
//		//System.out.println(recommandDAO.getPlanList("AU").toString());
//	}
}