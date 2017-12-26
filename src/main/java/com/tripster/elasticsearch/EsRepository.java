package com.tripster.elasticsearch;

import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHits;
import org.junit.Test;

import static org.elasticsearch.common.xcontent.XContentFactory.*;

import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;


import com.fasterxml.jackson.annotation.JsonProperty;

@Repository
public class EsRepository {
    private Client client;

    @Autowired
    public EsRepository(Client client) {
        this.client = client;
    }
    
    // Index = DB 
    public String getIndexName() {
        return "test";
    }
    // Type = Table
    public String getTypeName() {
        return "contents";
    }
    
    // 데이터 생성 
    public void insertContents(String contentsId, String categoryId, String title, String contents) throws IOException{
        
        // Elasticsearch의 helper로 만든 JSON 문자열 문서 인덱싱하기  
        IndexResponse response = client.prepareIndex(getIndexName(), "contents" , contentsId)
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

/*   
  	PUT /mm
    {
      "settings": {
        "number_of_shards": 1,
        "number_of_replicas": 0
      },
      "mappings": {
        "song": {
          "properties": {
            "name": {"type": "text"}
          }
        }
      }
    }
*/
 // 데이터 조회 테스트
    public int listCount(String prefix) throws IOException{
     /*   SearchResponse response = client.prepareSearch("mm")
		        .setTypes("song")
		        .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
		        .setQuery(QueryBuilders.prefixQuery("name", prefix))
		        .setFrom(0).setSize(20).setExplain(true)
		        .get();
    
	    SearchHits hits = response.getHits();
	    int result = (int) hits.getTotalHits();
	    return result;
	    */
    		return 10;
    }
    
    public List<String> listCriteria(String prefix) throws IOException{ /*
    public SearchHits listCriteria(String prefix) throws IOException{
       SearchResponse response = client.prepareSearch("mm")
		        .setTypes("song")
		        .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
		        .setQuery(QueryBuilders.prefixQuery("name", prefix))
		        .setFrom(0).setSize(20).setExplain(true)
		        .get();
    
	    SearchHits hits = response.getHits();
	    return hits; */
    		List result = new ArrayList();
    		result.add("test1");
    		result.add("test2");
    		result.add("test3");
    		result.add("test4");
    		result.add("test5");
    		result.add("test6");
    		result.add("test7");
    		result.add("test8");
    		result.add("test9");
    		result.add("test10");
    		return result;
    }

	
}