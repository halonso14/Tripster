package com.tripster.persistence;

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

	@Override
	public void insertMemo(MemoVO vo) throws Exception {
		session.insert(namespace+".insertMemo",vo);
		
	}

	@Override
	public void updateMemo(MemoVO vo) throws Exception {
		session.update(namespace+".updateMemo",vo);
	}

	@Override
	public void deleteMemo(int planDetailID) throws Exception {
		session.delete(namespace+".deleteMemo",planDetailID);
	}

	@Override
	public String selectMemo(int planDetailID) throws Exception {
		return session.selectOne(namespace+".selectOneMemo",planDetailID);
	}

	@Override
	public void addAttach(String memoPictureName) throws Exception {
		session.insert(namespace+".addAttach", memoPictureName);
	}

	@Override
	public List<String> getAttach(int planDetailID) throws Exception {
		return session.selectList(namespace+".getAttach", planDetailID);
	}

	@Override
	public void deleteAttach(int planDetailID) throws Exception {
		 session.delete(namespace+".deleteAttach", planDetailID);
		
	}

	
	

}
