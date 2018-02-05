package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.domain.Criteria;
import com.tripster.domain.MemberVO;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.ContentsReviewDAO;
import com.tripster.persistence.MemberDAO;

@Service
public class ContentsReviewServiceImpl implements ContentsReviewService {
	
	@Inject 
	private ContentsReviewDAO dao;
	
	@Inject 
	private ContentsDAO contentsDao;
	
	@Inject
	private MemberDAO memberDao;

	@Transactional
	@Override
	public void writeReview(ContentsReviewVO vo) throws Exception {
		
		dao.write(vo);
		if(vo.getReviewPictureName() != null) {
			dao.registReviewPicture(vo.getReviewPictureName());
		}
		contentsDao.updateReviewCnt(vo.getContentsID(), 1);
		
	}

	@Override
	public void modifyReview(ContentsReviewVO vo) throws Exception {
		dao.modify(vo);
	}

	@Transactional
	@Override
	public void deleteReview(Integer contentsReviewID) throws Exception {
		Integer contentsID = dao.getContentsID(contentsReviewID);
		dao.delete(contentsReviewID);
		contentsDao.updateReviewCnt(contentsID, -1);
	}

	@Override
	public List<ContentsReviewVO> getReviewList(Integer contentsID, Criteria cri) throws Exception {
		
		// 리뷰 리스트 받기
		List<ContentsReviewVO> list = dao.getReviewList(contentsID, cri);
		// 리뷰 리스트의 리뷰에 첨부파일 이름 넣기
		for(int i=0;i<list.size();i++) {
			// 리뷰리스트에 있는 리뷰의 첨부파일리스트 이름 저장
			String str = dao.getFileNames(list.get(i).getContentsReviewID());
			MemberVO memberVO = memberDao.mypage(list.get(i).getMemberID());
			list.get(i).setReviewPictureName(str);
			list.get(i).setMemberPictureName(memberVO.getMemberPicture());
		}
		
		return list;
	}

	@Override
	public int getTotalReviewNum(Integer contentsID) throws Exception {
		return dao.getTotalReviewNum(contentsID);
	}
	
	//리뷰 아이디를 받아 파일 이름 조회
	@Override
	public String getFileNames(Integer reviewID) throws Exception{
		return dao.getFileNames(reviewID);
	}
	
	
}