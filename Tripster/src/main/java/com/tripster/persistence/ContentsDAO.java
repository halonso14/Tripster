package com.tripster.persistence;

import com.tripster.domain.ContentsVO;

public interface ContentsDAO {
	
	public ContentsVO read(Integer id) throws Exception;
	
	public void insert(ContentsVO vo) throws Exception;

}
