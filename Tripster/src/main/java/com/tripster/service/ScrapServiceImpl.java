package com.tripster.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.ScrapVO;
import com.tripster.persistence.ScrapDAO;

@Service
public class ScrapServiceImpl implements ScrapService{
	
	@Inject
	private ScrapDAO dao;
	
	@Override
	public void regist(ScrapVO board)throws Exception{
		dao.create(board);
	}

}
