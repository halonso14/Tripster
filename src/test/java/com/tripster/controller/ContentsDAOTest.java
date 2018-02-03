package com.tripster.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
			ArrayList<Object> list;
			Map<String, Object> map; 
			String data = dao.getRestaurantDetail(60000).getContents();
			String json = "[{'name': 'Test order1','detail': 'ahk ks'},{'name': 'Test order2','detail': 'Fisteku'}]";
		
			Collection<List<Map<String,String>>> readValues = new ObjectMapper().readValue(json, new TypeReference<List<Collection<List<Map<String,String>>>>>(){});
//			map = mapper.readValue(json, new TypeReference<Map<String,Object>>(){});
			
			System.out.println(readValues.toString());
			
			}catch (JsonGenerationException e) { 
				e.printStackTrace(); 
			}catch (JsonMappingException e) { 
				e.printStackTrace(); 
			}catch (IOException e) { 
				e.printStackTrace(); 
			}
		
//			
//			String data = dao.getRestaurantDetail(60000).getContents();
//			String json = data.replace("[", "").replace("]", "").replaceAll("'", "\"");
//			//String[] jsonArray = json.split(",");
////			System.out.println(json.indexOf(","));
//			System.out.println(json.substring(0,json.indexOf(",")));
//			String json2 = json.substring(json.indexOf(",")+2);
////			System.out.println(json2);
//			System.out.println(json2.substring(0, json2.indexOf(",")));
//			System.out.println(json2.substring(json2.indexOf(",")+2));
			
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