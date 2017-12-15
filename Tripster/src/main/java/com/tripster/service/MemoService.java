package com.tripster.service;

import java.util.Map;

import com.tripster.domain.MemoVO;

public interface MemoService {
	//등록
	public void registerMemo(MemoVO vo)throws Exception;
	
	//수정
	public void updateMemo(MemoVO vo)throws Exception;
	
	//메모 삭제
	public void deleteMemo(int planDetailID)throws Exception;
	
	//메모 조회
	public Map<String,Object>  selectMemo(int planDetailID)throws Exception;
}
