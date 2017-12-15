package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.ScrapVO;
import com.tripster.persistence.ScrapDAO;

@Service
public class ScrapServiceImpl implements ScrapService{
	
	@Inject
	private ScrapDAO dao;

	// 스크랩 리스트 조회
	@Override
	public List<ScrapVO> listAll(Integer memberid) throws Exception {
		return dao.listAll(memberid);
	}
	
	// 스크랩 추가 
	@Override
	public void scrap(Integer contentsID) throws Exception{
		
		ContentsVO cont = new ContentsVO();
		ScrapVO vo = new ScrapVO();
		cont = dao.read(contentsID);
		vo.setCodeID(cont.getCodeID());
		vo.setContentsID(cont.getID());
		vo.setContentsTitle(cont.getTitle());
		vo.setContentsPhoto(cont.getContents());
		dao.insert(vo);
		
	}
	
	// 스크랩 리스트에서 스크랩 삭제
	@Override
	public void scrapIDRemove(Integer scrapID) throws Exception{
		dao.scrapIDRemove(scrapID);
	}
	
	// 컨텐츠에서 스크랩 삭제
	@Override
	public void contentsScrapDelete(Integer contentsID) throws Exception{
		dao.contentsScrapDelete(contentsID);
	}

}
