package com.tripster.elasticsearch;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
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
	
	
    // 컨텐츠 검색결과 리스트 조회
    public SearchResponse contentsSearch(SearchCriteria cri) throws Exception{
    		
    		// 쿼리빌더 (검색키워드,검색할 필드(복수가능))
        QueryBuilder qb = QueryBuilders.multiMatchQuery( 
        		cri.getKeyword(),     					
            "contents_title", "contents_keyword", "contents_contents"		
    		);
        
        SearchResponse response = client
        			.prepareSearch("contents").setTypes("contents") 	// 검색할 테이블 
                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setQuery(qb)
                .setSize(500).get();	// 가져올 검색결과 갯수 
       
        return response;
    }
 
	// 일정 검색결과 리스트 조회
    public SearchResponse planSearch(SearchCriteria cri) throws Exception{
 		
    		// 쿼리빌더 (검색키워드,검색할 필드(복수가능))
        QueryBuilder qb = QueryBuilders.multiMatchQuery(
    			cri.getKeyword(),			
            "plan_title","member_name"				
    		);
        
        SearchResponse response = client
        			.prepareSearch("plan").setTypes("plan") 	// 검색할 테이블 
                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setQuery(qb)
                .setSize(500).get();	// 가져올 검색결과 갯수
       
        return response;
    }
 
    
	// 유저 검색결과 리스트 조회
    public SearchResponse memberSearch(SearchCriteria cri) throws Exception{
    		
    		// 쿼리빌더 (검색키워드,검색할 필드(복수가능))
        QueryBuilder qb = QueryBuilders.multiMatchQuery(
    			cri.getKeyword(),			
            "member_name"				
    		);
        
        SearchResponse response = client
        			.prepareSearch("member").setTypes("member") 	// 검색할 테이블 
                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setQuery(qb)
                .setSize(500).get();	// 가져올 검색결과 갯수 
       
        return response;
    }

}