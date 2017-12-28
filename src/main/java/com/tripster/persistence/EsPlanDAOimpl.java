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
import com.tripster.domain.SearchCriteria;
import com.tripster.elasticsearch.EsSearchMapper;

@Repository
public class EsPlanDAOimpl implements EsPlanDAO {
	
	@Inject
	private EsSearchMapper namespace;
	
	// 일정 검색결과 더보기 리스트 조회
	@Override
	public List<EsPlanVO> getPlanList(SearchCriteria cri) throws Exception{
		SearchResponse response = namespace.planSearch(cri);
		SearchHits hits = response.getHits();
		
		ArrayList<EsPlanVO> result = new ArrayList<EsPlanVO>();
		ObjectMapper om = new ObjectMapper(); 
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		for(SearchHit hit : hits) {
	    		String sJson = hit.getSourceAsString();
	    		EsPlanVO plan = om.readValue(sJson, EsPlanVO.class);
	    		result.add(plan);
		}
		return result;
	}
	
	// 일정 검색결과 건수 조회 
	public long getTotalPlanNum(SearchCriteria cri) throws Exception{
		SearchResponse response = namespace.planSearch(cri);
		long result = response.getHits().getTotalHits();
		return result;
	}
}

