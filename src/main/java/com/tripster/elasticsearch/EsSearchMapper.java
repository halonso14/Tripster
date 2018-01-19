package com.tripster.elasticsearch;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.SimpleQueryStringBuilder;
import static org.elasticsearch.index.query.QueryBuilders.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripster.domain.SearchCriteria;

@Repository
public class EsSearchMapper {
	
	// EsConfig로 Es연결
	private Client client;
	// Es client 객체 받아오기
	@Autowired
    public EsSearchMapper(Client client) {
        this.client = client;
    }
    
	// 컨텐츠 검색결과 더보기 리스트 조회
    public SearchResponse contentsSearch(SearchCriteria cri) throws Exception{
 		
    	SimpleQueryStringBuilder qb = simpleQueryStringQuery(cri.getKeyword());	
    		
        SearchResponse response = client.prepareSearch()
        		.setIndices("contents").setTypes("contents").setQuery(qb).setSize(500).get();
        
        return response;
    }
 
	// 일정 검색결과 더보기 리스트 조회
    public SearchResponse planSearch(SearchCriteria cri) throws Exception{
 		
    	SimpleQueryStringBuilder qb = simpleQueryStringQuery(cri.getKeyword());	
    		
        SearchResponse response = client.prepareSearch()
        		.setIndices("plan").setTypes("plan").setQuery(qb).setSize(500).get();
        
        return response;
    }
    
	// 유저 검색결과 더보기 리스트 조회
    public SearchResponse memberSearch(SearchCriteria cri) throws Exception{
 		
    	SimpleQueryStringBuilder qb = simpleQueryStringQuery(cri.getKeyword());	
    		
        SearchResponse response = client.prepareSearch()
        		.setIndices("member").setTypes("member").setQuery(qb).setSize(500).get();
        
        return response;
    }
    
//    public SearchResponse a(SearchCriteria cri )
   

}