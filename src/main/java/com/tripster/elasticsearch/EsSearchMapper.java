package com.tripster.elasticsearch;

import org.elasticsearch.action.search.MultiSearchResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.SimpleQueryStringBuilder;
import org.elasticsearch.search.SearchHit;

import static org.elasticsearch.index.query.QueryBuilders.*;

import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripster.domain.SearchCriteria;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tripster.domain.EsContentsVO;

@Repository
public class EsSearchMapper {
	
	// EsConfig로 Es연결
	private Client client;
	// Es client 객체 받아오기
	@Autowired
    public EsSearchMapper(Client client) {
        this.client = client;
    }
   
	// 검색할 DataBase 지정 
    public String getIndexName() {
        return "test";
    }
    
	// 컨텐츠 검색결과 더보기 리스트 조회
    public SearchResponse contentsSearch(SearchCriteria cri) throws Exception{
 		
    	SimpleQueryStringBuilder qb = simpleQueryStringQuery(cri.getKeyword());	
    		
        SearchResponse response = client.prepareSearch()
        		.setIndices(getIndexName()).setTypes("contents").setQuery(qb).get();
        
        return response;
    }
    
    public List<EsContentsVO> getAllDocs(SearchCriteria cri) throws JsonParseException, JsonMappingException, IOException{
        int scrollSize = 1000;
        SimpleQueryStringBuilder qb = simpleQueryStringQuery(cri.getKeyword());	
        List<EsContentsVO> esData = new ArrayList<EsContentsVO>();
		ObjectMapper om = new ObjectMapper(); 
		
		
        SearchResponse response = null;
        int i = 0;
        while( response == null || response.getHits().hits().length != 0){
            response = client.prepareSearch()
            		.setIndices(getIndexName())
            		.setTypes("contents")
            		.setQuery(qb)
            		.setSize(scrollSize)
            		.setFrom(i * scrollSize)
            		.get();
            om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            for(SearchHit hit : response.getHits()){
	    			String sJson = hit.getSourceAsString();
	    			EsContentsVO contents = om.readValue(sJson, EsContentsVO.class);
                esData.add(contents);
            }
            i++;
        }
        return esData;
    }
    
	// 일정 검색결과 더보기 리스트 조회
    public SearchResponse planSearch(SearchCriteria cri) throws Exception{
 		
    	SimpleQueryStringBuilder qb = simpleQueryStringQuery(cri.getKeyword());	
    		
        SearchResponse response = client.prepareSearch()
        		.setIndices(getIndexName()).setTypes("plan").setQuery(qb).get();
        
        return response;
    }
    
	// 유저 검색결과 더보기 리스트 조회
    public SearchResponse memberSearch(SearchCriteria cri) throws Exception{
 		
    	SimpleQueryStringBuilder qb = simpleQueryStringQuery(cri.getKeyword());	
    		
        SearchResponse response = client.prepareSearch()
        		.setIndices(getIndexName()).setTypes("member").setQuery(qb).get();
        
        return response;
    }
    
	// 통합 검색결과 리스트 조회
    public HashMap<String,SearchResponse> multiSearch(SearchCriteria cri) throws Exception{
 		
    		SimpleQueryStringBuilder qb = simpleQueryStringQuery(cri.getKeyword());	
       
    		ArrayList<String> type = new ArrayList<String>();	
    		type.add(0,new String("cotents"));
    		type.add(1,new String("plan"));
    		type.add(2,new String("member"));
    		
        MultiSearchResponse items = client.prepareMultiSearch()
        		.add(client.prepareSearch(getIndexName()).setTypes(type.get(0)).setQuery(qb))
        		.add(client.prepareSearch(getIndexName()).setTypes(type.get(1)).setQuery(qb))
        		.add(client.prepareSearch(getIndexName()).setTypes(type.get(2)).setQuery(qb))
        		.get();
       
        ListIterator<String> types = type.listIterator(0);
        HashMap<String,SearchResponse> responses = new HashMap<>();
        
//        long totalHits = 0;
       
        for (MultiSearchResponse.Item item : items.getResponses()) {
			SearchResponse response = item.getResponse();
			responses.put(types.next(),response);		
//			totalHits += response.getHits().getTotalHits();
		}
        return responses;
    }
    

    


}
