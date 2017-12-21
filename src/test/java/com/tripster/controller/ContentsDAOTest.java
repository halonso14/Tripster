package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.Criteria;
import com.tripster.persistence.ContentsDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ContentsDAOTest {

	@Inject
	private ContentsDAO dao;
	
	Criteria cri = new Criteria();
	
	//컨텐츠 상세 정보 검색 / 조회수 갱신 테스트
//	@Test
//	public void testRead() throws Exception {
//		System.out.println(dao.read(1).toString());
//		dao.updateContentsViewCnt(1);
//		System.out.println(dao.read(1).toString());
//	}
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
}
