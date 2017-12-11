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

	@Override
	public List<ScrapVO> listAll(Integer memberid) throws Exception {
		return dao.listAll(memberid);
	}
	
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
	
	@Override
	public void delete(Integer scrapID) throws Exception{
		dao.delete(scrapID);
	}

}
