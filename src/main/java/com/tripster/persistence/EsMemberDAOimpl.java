package com.tripster.persistence;

import java.util.*;
import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;

import com.tripster.domain.EsMemberVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.elasticsearch.EsSearchMapper;

@Repository
public class EsMemberDAOimpl implements EsMemberDAO {
	
	@Inject
	private EsSearchMapper namespace;
	
	// 유저 검색결과 더보기 리스트 조회
	public List<EsMemberVO> getMemberList(SearchCriteria cri) throws Exception{
		
		SearchResponse response = namespace.memberSearch(cri);
		SearchHits hits = response.getHits();
		
		ArrayList<EsMemberVO> result = new ArrayList<EsMemberVO>();
		ObjectMapper om = new ObjectMapper(); 
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		for(SearchHit hit : hits) {
	    		String sJson = hit.getSourceAsString();
	    		EsMemberVO member = om.readValue(sJson, EsMemberVO.class);
	    		result.add(member);
		}
		return result;
	}
	// 유저 검색결과 건수 조회 
	public long getTotalMemberNum(SearchCriteria cri) throws Exception{
		SearchResponse response = namespace.memberSearch(cri);
		long result = response.getHits().getTotalHits();
		return result;
	}
}
