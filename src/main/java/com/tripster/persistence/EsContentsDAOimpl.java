package com.tripster.persistence;

import java.util.*;
import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;

import com.tripster.domain.EsContentsVO;
import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.elasticsearch.EsSearchMapper;

@Repository
public class EsContentsDAOimpl implements EsContentsDAO {
	
	@Inject
	private EsSearchMapper namespace;
    
	// 컨텐츠 검색결과 리스트 조회
	@Override
	public EsSearchResultVO getContentsList(SearchCriteria cri, Integer size) throws Exception{
		
		SearchResponse response = namespace.contentsSearch(cri,size);
		SearchHits hits = response.getHits();
		
		EsSearchResultVO resultset = new EsSearchResultVO();
		ArrayList<EsContentsVO> result = new ArrayList<EsContentsVO>();
		
		ObjectMapper om = new ObjectMapper(); 
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		for(SearchHit hit : hits) {
	    		String sJson = hit.getSourceAsString();
	    		EsContentsVO contents = om.readValue(sJson, EsContentsVO.class);
	    		result.add(contents);
		}
		resultset.setContentsList(result); 
		resultset.setContentsCnt(hits.getTotalHits()); 
		return resultset;
	}

	
}
