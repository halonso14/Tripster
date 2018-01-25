package com.tripster.elasticsearch;

import java.util.ArrayList;
import java.util.List;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tripster.domain.EsContentsVO;
import com.tripster.domain.SearchCriteria;

@Repository
public class EsSearchScroll {
	
	// EsConfig로 Es연결
	private Client client; 
	// Es client 객체 받아오기
	@Autowired
    public EsSearchScroll(Client client) {
        this.client = client;
    }
	
	
    // 컨텐츠 검색결과 리스트 조회
    public List<String> getContentsList(SearchCriteria cri, String scrollID) throws Exception{
    		
		ArrayList<String> results = new ArrayList<String>();
		SearchHits hits;
    		// 쿼리빌더 (검색키워드,검색할 필드(복수가능))
        QueryBuilder qb = QueryBuilders.multiMatchQuery( 
        		cri.getKeyword(),     					
            "contents_title", "contents_keyword", "contents_contents"		
    		);
        
        if(scrollID.equals("")) {
    			SearchResponse response = client
    					.prepareSearch("contents").setTypes("contents") 	// 검색할 테이블 
             		.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setQuery(qb)
             		.setScroll("1m").setSize(10).get(); 	//스크롤 당 최대 100건의 결과를 가져옵니다
             
             results.add(response.getScrollId());
             System.out.println(results);
             hits = response.getHits();
        			
        }else {
        		SearchResponse response = client
        				.prepareSearchScroll(scrollID)
        				.setScroll("1m").execute().actionGet(); 
        		results.add(response.getScrollId());
        		hits = response.getHits();
        }

    		for (SearchHit hit : hits) {
    			String result = hit.getSourceAsString();
    			System.out.println(result);
    	    		results.add(result);       			
    		}
        		
        System.out.println(results.size());
        return results;
    }  
    
    // 컨텐츠 검색결과 더보기리스트 조회
    public List<String> getContentsMore(SearchCriteria cri) throws Exception{
    		
		ArrayList<String> results = new ArrayList<String>();
		
    		// 쿼리빌더 (검색키워드,검색할 필드(복수가능))
        QueryBuilder qb = QueryBuilders.multiMatchQuery( 
        		cri.getKeyword(),     					
            "contents_title", "contents_keyword", "contents_contents"		
    		);
        
        SearchResponse response = client
        		.prepareSearch("contents").setTypes("contents") 	// 검색할 테이블 
        		.setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setQuery(qb)
        		.setScroll("1m")
        		.setSize(10).get(); 	//스크롤 당 최대 100건의 결과를 가져옵니다

        do {
        		for (SearchHit hit : response.getHits()) {
        			String result = hit.getSourceAsString();
        			System.out.println(result);
	    	    		results.add(result);       			
        		}
        		System.out.println(response.getScrollId());
        		response = client.prepareSearchScroll(response.getScrollId()).setScroll(new TimeValue(60000)).execute().actionGet();
        }while(response.getHits().getHits().length != 0); // 0은 스크롤이 끝나고 do ~ while 반복구문의 종료를 가리킵니다
        System.out.println(results.size());
        return results;
    }  
}
