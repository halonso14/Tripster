package com.tripster.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.domain.MemoVO;
import com.tripster.persistence.MemoDAO;

@Service
public class MemoServiceImpl implements MemoService{
	
	@Inject
	private MemoDAO memoDAO;

	@Transactional
	@Override
	public void registerMemo(MemoVO vo) throws Exception {
		memoDAO.insertMemo(vo);
//		
//		String[] files = vo.getMemoPictures();
//		
//		if(files == null) return;
//		
//		for(String memoPictureName: files) {
//			memoDAO.addAttach(memoPictureName);
		//}
		
	}

	@Override
	public void updateMemo(MemoVO vo) throws Exception {
		memoDAO.updateMemo(vo);
	}

	@Transactional
	@Override
	public void deleteMemo(int planDetailID) throws Exception {
		memoDAO.deleteMemo(planDetailID);
		memoDAO.deleteAttach(planDetailID);
	}

	@Transactional
	@Override
	public Map<String, Object>  selectMemo(int planDetailID) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		MemoVO memoVO= new MemoVO();
		
		String memoContents = memoDAO.selectMemo(planDetailID);
		List<String> memoPictures = memoDAO.getAttach(planDetailID);
		
		memoVO.setMemoContents(memoContents);
		memoVO.setMemoPictureName(memoPictures);
		
		map.put("memoVO", memoVO);
		return map;
	}

	
	
}
