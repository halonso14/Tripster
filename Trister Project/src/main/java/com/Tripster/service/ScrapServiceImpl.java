package com.Tripster.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Tripster.domain.ScrapVO;
import com.Tripster.persistence.ScrapDAO;

@Service
public class ScrapServiceImpl implements ScrapService{
	
	@Inject
	private ScrapDAO dao;
	
	@Override
	public void regist(ScrapVO board)throws Exception{
		dao.create(board);
	}

}
