package com.tripster.persistence;

import java.util.*;

import com.tripster.domain.EsMemberVO;
import com.tripster.domain.SearchCriteria;

public interface EsMemberDAO {
	// 유저 검색결과 더보기 리스트 조회
	public List<EsMemberVO> getMemberList(SearchCriteria cri) throws Exception;
	// 유저 검색결과 건수 조회 
	public long getTotalMemberNum(SearchCriteria cri) throws Exception;
}
