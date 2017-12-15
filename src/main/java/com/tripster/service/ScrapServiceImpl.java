package com.tripster.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.ScrapVO;
import com.tripster.persistence.ScrapDAO;

@Service
public class ScrapServiceImpl implements ScrapService{
	
	@Inject
	private ScrapDAO dao;
	
	@Override
	public void scrap(ScrapVO scrap)throws Exception{
		dao.create(scrap);
	}
	
	@Override
	public List<ScrapVO> listAll() throws Exception {
		return dao.listAll();
	}

}
