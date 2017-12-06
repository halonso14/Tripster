package com.tripster.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.ContentsVO;
import com.tripster.persistence.ContentsDAO;

@Service
public class ContentsServiceImpl implements ContentsService{
	
	@Inject 
	private ContentsDAO dao;
	
	public ContentsVO read(Integer id) throws Exception{
		return dao.read(id);
	}

}
