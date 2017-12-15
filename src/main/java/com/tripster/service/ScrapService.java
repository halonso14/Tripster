package com.tripster.service;

import java.util.List;

import com.tripster.domain.ScrapVO;

public interface ScrapService {
	
	public void scrap(ScrapVO scrap)throws Exception;
	
	public List<ScrapVO> listAll() throws Exception;
		
}
