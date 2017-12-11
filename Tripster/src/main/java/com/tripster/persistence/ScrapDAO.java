package com.tripster.persistence;

import java.util.List;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.ScrapVO;

public interface ScrapDAO {
	
	public List<ScrapVO> listAll(Integer memberid) throws Exception;
	
	public void insert(ScrapVO vo) throws Exception;
	
	public void delete(Integer scrapID) throws Exception;
	
	public ContentsVO read(Integer id) throws Exception;
	
}
