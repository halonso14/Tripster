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
	private ContentsDAO contentsDAO;
    
	// 컨텐츠 검색결과 리스트 조회
	@Override
	public EsSearchResultVO getContentsList(SearchCriteria cri, Integer size) throws Exception{
		
		SearchResponse response = namespace.contentsSearch(cri,size);
		SearchHits hits = response.getHits();
		
		EsSearchResultVO resultset = new EsSearchResultVO();
		ArrayList<EsContentsVO> result = new ArrayList<EsContentsVO>();
		
		ObjectMapper om = new ObjectMapper(); 
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		List<EsContentsVO> plan = contentsDAO.getPlanCntList(); 
		List<EsContentsVO> review = contentsDAO.getReviewCntList(); 
		List<EsContentsVO> scrap = contentsDAO.getScrapCntList();
		
		int index = 0;
		for(SearchHit hit : hits) {
	    		String sJson = hit.getSourceAsString();
	    		EsContentsVO contents = om.readValue(sJson, EsContentsVO.class);
	    		result.add(contents);
	
	    		// 일치하는 값이 없을경우 엘라스틱 디비에 있는 값이 들어옴
	    		for(int i=0;i<plan.size();i++) {
	    			if(result.get(index).getContents_id() == plan.get(i).getContents_id()) {
	    				result.get(index).setContents_plan_cnt(plan.get(i).getContents_plan_cnt());
	    				break;
	    			}
	    		}
	    		
	    		for(int i=0;i<review.size();i++) {
	    			if(result.get(index).getContents_id() == review.get(i).getContents_id()) {
	    				result.get(index).setContents_review_cnt(review.get(i).getContents_review_cnt());
	    				break;
	    			}
	    		}
	    		
	    		for(int i=0;i<scrap.size();i++) {
	    			if(result.get(index).getContents_id() == scrap.get(i).getContents_id()) {
	    				result.get(index).setContents_scrap_cnt(scrap.get(i).getContents_scrap_cnt());
	    				break;
	    			}
	    		}
	    		
	    		index ++;

		}
		
		resultset.setContentsList(result);
		resultset.setContentsCnt(hits.getTotalHits()); 
		return resultset;
	}

	
}
