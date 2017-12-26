package com.tripster.elasticsearch;

import java.util.HashMap;

import org.elasticsearch.search.SearchHit;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import com.tripster.elasticsearch.EsRepository;

@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class clientConnetionTest {
//	private EsRepository esRepository;
//	
//	@Test
//	public void test1() {
//		HashMap<String, Object> result = esRepository.findSongWithPrefix("시그");
//
//
//		SearchHit [] hits = (SearchHit [])result.get("contentsList");
//		System.out.println("Total : " + result.get("total"));
//		System.out.println("Song Name : " + hits[0].getSource().get("name"));
//	}
}
