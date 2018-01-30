package com.tripster.persistence;

import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.SearchCriteria;

public interface EsMemberDAO {
	// 회원 검색결과 리스트 조회
	public EsSearchResultVO getMemberList(SearchCriteria cri, Integer size) throws Exception;
    // 회원 등록 
    public void insertEsMember(MemberVO vo) throws Exception;
    // 회원 수정 
    public void updateEsMember(MemberVO vo) throws Exception;
    // 회원 삭제
    public void deleteEsMember(String memberID) throws Exception;
    
}
