package com.tripster.persistence;

import java.util.*;
import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;

import com.tripster.domain.EsPlanVO;
import com.tripster.domain.EsSearchResult;
import com.tripster.domain.SearchCriteria;
import com.tripster.elasticsearch.EsSearchMapper;

@Repository
public class EsPlanDAOimpl implements EsPlanDAO {
	
	@Inject
	private EsSearchMapper namespace;
	
	// 일정 검색결과 리스트 조회
	@Override
	public EsSearchResult getPlanList(SearchCriteria cri, Integer size) throws Exception {
		
		SearchResponse response = namespace.planSearch(cri, size);
		SearchHits hits = response.getHits();
		
		EsSearchResult resultset = new EsSearchResult();
		ArrayList<EsPlanVO> result = new ArrayList<EsPlanVO>();
		
		ObjectMapper om = new ObjectMapper(); 
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		for(SearchHit hit : hits) {
	    		String sJson = hit.getSourceAsString();
	    		EsPlanVO plan = om.readValue(sJson, EsPlanVO.class);
	    		result.add(plan);
		}
		
		resultset.setPlanList(result); 
		resultset.setPlanCnt(hits.getTotalHits()); 
		return resultset;
	}
	

}

