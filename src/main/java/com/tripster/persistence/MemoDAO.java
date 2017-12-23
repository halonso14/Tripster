package com.tripster.persistence;

import java.util.List;
import java.util.Map;

import com.tripster.domain.MemoVO;

public interface MemoDAO {
	//메모 등록
	public void insertMemo(MemoVO vo)throws Exception;
	
	//메모 수정 
	public void updateMemo(MemoVO vo)throws Exception;
	
	//메모 삭제
	public void deleteMemo(int planDetailID) throws Exception;
	
	//메모 조회
	public String selectMemo(int planDetailID) throws Exception;

	//사진 추가
	public void addAttach(String MemoPictureName, int planDetailID) throws Exception;
	
	//사진 조회
	public List<String> getAttach(int planDetailID) throws Exception;
	
	//사진 삭제
	public void deleteAttach(int planDetailID) throws Exception;
}
