package com.tripster.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.domain.Criteria;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.ContentsReviewDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ContentsReviewTest {
	
	@Inject
	ContentsReviewDAO dao;
	@Inject
	ContentsDAO contentsDAO;

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
		Criteria cri = new Criteria();
		cri.setCurPage(1);
		List<ContentsReviewVO> list = dao.getReviewList(1, cri);
		
		for(int i=0;i<list.size();i++) {
			
			List<String> str = dao.getFileNames(list.get(i).getContentsReviewID());
			System.out.println(str.toString());
			System.out.println("i"+i);
			System.out.println(list.get(i).getContentsReviewID());
			list.get(i).setReviewPictureName(str);
			
		}
		
		System.out.println(list.toString());
		
		
	}

}
