package com.tripster.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.ContentsReviewDAO;
import com.tripster.service.ContentsReviewService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ContentsReviewTest {
	
	@Inject
	ContentsReviewDAO dao;
	@Inject
	ContentsDAO contentsDAO;
	@Inject
	ContentsReviewService service;

//	@Test
//	public void registTest() throws Exception {
//		ContentsReviewVO vo = new ContentsReviewVO();
//		String[] str = {"0","1","2"};
//		vo.setContentsID(1);
//		vo.setMemberID(1);
//		vo.setContentsReview("1");
//		vo.setReviewPictureName(str);
//		dao.write(vo);
//		for(int i=0;i<vo.getReviewPictureName().length;i++) {
//			dao.registReviewPicture(vo.getReviewPictureName()[i]);
//		}
//	}
	
//	@Test
//	public void mapperTest() throws Exception{
//		
//		List<ContentsReviewVO> list = new ArrayList<ContentsReviewVO>();
//		Criteria cri = new Criteria();
//		cri.setCurPage(1);
//		list = dao.getReviewList(1,cri);
//		System.out.println(list.toString());
//		
//	}
	
//	@Test
//	public void getFileNames() throws Exception{
//		List<String> filenames = dao.getFileNames(41);
//		System.out.println(filenames.toString());
//	}
	
	@Test
	public void reviewList() throws Exception{
		String filename = "/2018/02/05/f2e78941-3003-4257-a4ed-4ad2fb2f81e3_gggg.png";
		dao.deleteFileName(filename);
		
	}
	
//	@Test
//	public void rankingTest() throws Exception{
//		System.out.println("1");
//		//댓글 리스트 정보를 전달하기 위해, Criteria 객체 생성
////		Criteria cri = new Criteria();
//		//현재 댓글 페이지 정보 저장
////		cri.setCurPage(1);
////		
////		System.out.println(dao.getReviewList(1, cri).get(1).toString());
////		
//	}

}
