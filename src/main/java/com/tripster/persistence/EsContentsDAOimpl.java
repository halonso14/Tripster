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
	@Inject
	private ContentsDAO dao;
    
	// 컨텐츠 검색결과 리스트 조회
	@Override
	public EsSearchResultVO getContentsList(SearchCriteria cri, Integer size) throws Exception{
		
		SearchResponse response = namespace.contentsSearch(cri,size);
		SearchHits hits = response.getHits();
		
		EsSearchResultVO resultset = new EsSearchResultVO();
		ArrayList<EsContentsVO> result = new ArrayList<EsContentsVO>();
		
		ObjectMapper om = new ObjectMapper(); 
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		int index = 0;
		
		for(SearchHit hit : hits) {
	    		String sJson = hit.getSourceAsString();
	    		EsContentsVO contents = om.readValue(sJson, EsContentsVO.class);
	    		result.add(contents);

//	    		int contents_review_cnt = dao.getRestaurantDetail(result.get(index).getContents_id()).getContentsReviewCnt();
//	    		int contents_scrap_cnt = dao.getRestaurantDetail(result.get(index).getContents_id()).getContentsScrapCnt();
//	    		int contents_plan_cnt = dao.getContentsPlan(result.get(index).getContents_id());
//	    		result.get(index).setContents_plan_cnt(contents_plan_cnt);
//	    		result.get(index).setContents_review_cnt(contents_review_cnt);
//	    		result.get(index).setContents_scrap_cnt(contents_scrap_cnt);
//	    		index++;

		}
		resultset.setContentsList(result);
		resultset.setContentsCnt(hits.getTotalHits()); 
		return resultset;
	}

	
}
