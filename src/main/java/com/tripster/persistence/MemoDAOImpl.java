package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.MemoVO;

@Repository
public class MemoDAOImpl implements MemoDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace ="com.tripster.mapper.memoMapper";

	//메모 등록
	@Override
	public void insertMemo(MemoVO vo) throws Exception {
		session.insert(namespace+".insertMemo",vo);
	}

	//메모 수정 
	@Override
	public void updateMemo(MemoVO vo) throws Exception {
		session.update(namespace+".updateMemo",vo);
	}
	
	//메모 삭제
	@Override
	public void deleteMemo(int planDetailID) throws Exception {
		session.delete(namespace+".deleteMemo",planDetailID);
	}

	//메모 조회
	@Override
	public String selectMemo(int planDetailID) throws Exception {
		return session.selectOne(namespace+".selectOneMemo",planDetailID);
	}

	//사진 추가
	@Override
	public void addAttach(String memoPictureName,int planDetailID) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("memoPictureName", memoPictureName);
		map.put("planDetailID", planDetailID);
		session.insert(namespace+".addAttach" ,map);
	}

	//사진 조회
	@Override
	public List<String> getAttach(int planDetailID) throws Exception {
		return session.selectList(namespace+".getAttach", planDetailID);
	}

	//사진 삭제
	@Override
	public void deleteAttach(int planDetailID) throws Exception {
		 session.delete(namespace+".deleteAttach", planDetailID);
		
	}


}
