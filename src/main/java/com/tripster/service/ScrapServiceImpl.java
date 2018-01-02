package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.ScrapVO;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.ScrapDAO;

@Service
public class ScrapServiceImpl implements ScrapService{
	
	@Inject
	private ScrapDAO scrapDao;
	@Inject 
	private ContentsDAO contentsDao;
	
	// 스크랩
	@Override
	public void scrap(Integer contentsID,Integer memberID)throws Exception{
		ContentsVO cont = new ContentsVO();
		ScrapVO vo = new ScrapVO();
		cont = contentsDao.getRestaurantDetail(contentsID);
		vo.setCategoryID(cont.getCategoryID());
		vo.setContentsID(cont.getContentsID());
		vo.setContentsTitle(cont.getTitle());
		vo.setContentsPhoto("photo");
		vo.setMemberID(memberID);
		scrapDao.create(vo);
	}
	
	// 스크랩 삭제
	@Override
	public void scrapDelete(Integer contentsID) throws Exception{
		scrapDao.scrapDelete(contentsID);
	}
	
	// 스크랩 리스트 조회
	@Override
	public List<ScrapVO> listAll(Integer memberID) throws Exception{
		return scrapDao.listAll(memberID);
	}
	
	// 컨텐츠에서 스크랩 삭제
	@Override
	public void scrapIDRemove(Integer contentsID) throws Exception{
		scrapDao.scrapIDRemove(contentsID);
	}
	
	// 스크랩 확인
	@Override
	public Integer scrapCheck(Integer contentsID,Integer memberID) throws Exception{
		// 멤버의 스크랩리스트 조회
		List<ScrapVO> list = scrapDao.listAll(memberID);	
		// 해당 페이지의 컨텐츠id를 받아 스크랩 조회
		for(int i=0;i<list.size();i++) {
			if(contentsID == list.get(i).getContentsID()) {
				return 0;
			}
		}
		return 1;
	}

}
