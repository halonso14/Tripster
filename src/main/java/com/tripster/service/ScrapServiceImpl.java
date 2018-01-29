package com.tripster.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tripster.domain.ContentsVO;
import com.tripster.domain.EsContentsVO;
import com.tripster.domain.ScrapVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.persistence.ContentsDAO;
import com.tripster.persistence.ScrapDAO;

@Service
public class ScrapServiceImpl implements ScrapService{
	
	@Inject
	private ScrapDAO scrapDao;
	
	// 스크랩
	@Override
	public void scrap(Integer memberID,Integer contentsID)throws Exception{
		scrapDao.create(memberID,contentsID);
	}
	
	// 스크랩 삭제
	@Override
	public void scrapDelete(Integer contentsID,Integer memberID) throws Exception{
		scrapDao.scrapDelete(contentsID,memberID);
	}
	
	// 스크랩 리스트 조회
	@Override
	public List<ScrapVO> listAll(Integer memberID) throws Exception{
		return scrapDao.listAll(memberID);
	}
	
	// 컨텐츠에서 스크랩 삭제
	@Override
	public void scrapIDRemove(Integer contentsID) throws Exception{
		scrapDao.scrapIDRemove(contentsID);
	}
	
	// 스크랩 확인
	@Override
	public Integer scrapCheck(Integer contentsID,Integer memberID) throws Exception{
		// 멤버의 스크랩리스트 조회
		List<ScrapVO> list = scrapDao.listAll(memberID);	
		// 해당 페이지의 컨텐츠id를 받아 스크랩 조회
		for(int i=0;i<list.size();i++) {
			if(contentsID == list.get(i).getContentsID()) {
				// 스크랩이 있으면 0 반환
				return 0;
			}
		}
		// 스크랩이 없으면 1반환
		return 1;
	}
	
	// 스크랩 체크 리스트
	@Override
	public List<Integer> scrapCheckList(Integer memberID,List<EsContentsVO> contentsList,SearchCriteria cri) throws Exception{
		
		List<Integer> scrapCheckList = new ArrayList<>();
		try {
			for(int i=cri.getPageStart();i<cri.getPerPageNum()*cri.getPage();i++) {
				scrapCheckList.add(scrapCheck(contentsList.get(i).getContents_id(),memberID));
			}			
		}catch(Exception e) {
			return scrapCheckList;
		}
		return scrapCheckList;
	}
	
	
	//***** searchController에서 사용합니다.*****	
	// 스크랩 리스트
	@Override
	public List<Integer> scrapIdList(Integer memberID) throws Exception{
		// 멤버의 스크랩리스트 조회
		List<ScrapVO> list = scrapDao.listAll(memberID);	
		
		// 스크랩한 contentsID 값만 리스트로 담아서 리턴 
		List<Integer> scrapIdList = new ArrayList<Integer>();
		try {
			for(int i=0; i<list.size(); i++) {
				scrapIdList.add(list.get(i).getContentsID());
			}
		}catch(Exception e) {
			return scrapIdList;
		}
		
		return scrapIdList;
	}
}