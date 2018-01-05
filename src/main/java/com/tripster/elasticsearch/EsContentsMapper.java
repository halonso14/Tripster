package com.tripster.elasticsearch;

import java.util.*;
import java.io.IOException;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripster.domain.SearchCriteria;

@Repository
public class EsContentsMapper {
	
	// EsConfig로 Es연결
	private Client client;
	// Es client 객체 받아오기
	@Autowired
    public EsContentsMapper(Client client) {
        this.client = client;
    }
   
	// DataBase 지정 
    public String getIndexName() {
        return "test";
    }
    // Table 지정
    public String getTypeName() {
    	 	return "contents";
    }

    
    // 컨텐츠 데이터 생성 
    public void insertContents(String contentsId, String categoryId, String title, String contents) throws IOException{
        
        // Elasticsearch의 helper로 만든 JSON 문자열 문서 인덱싱하기  
        IndexResponse response = client.prepareIndex(getIndexName(), getTypeName() , contentsId)
        		.setSource(jsonBuilder()
        				.startObject()
	            			.field("contentsId", contentsId)
	            			.field("categoryId", categoryId)
	            			.field("title", title)
	            			.field("contents", contents)
	            			.field("createdDate", new Date())
	            			.field("updatedDate", new Date())
            			.endObject()
    				)
        		.get();
    }


}

