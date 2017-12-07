package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.ScrapVO;

public interface ScrapDAO {
	
	public void create(ScrapVO vo) throws Exception;
	
	public List<ScrapVO> listAll() throws Exception;
	
}
