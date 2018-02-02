package com.tripster.persistence;

import java.util.*;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;

import com.tripster.domain.EsMemberVO;
import com.tripster.domain.EsPlanVO;
import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanVO;
import com.tripster.domain.SearchCriteria;
import com.tripster.elasticsearch.EsSearchMapper;

@Repository
public class EsPlanDAOimpl implements EsPlanDAO {
	
	// EsConfig로 Es연결
	private Client client; 
	// Es client 객체 받아오기
	@Autowired
    public EsPlanDAOimpl(Client client) {
        this.client = client;
    }

	@Inject
	private EsSearchMapper namespace;
	
	// 일정 검색결과 리스트 조회
	@Override
	public EsSearchResultVO getPlanList(SearchCriteria cri, Integer size) throws Exception {
		
		SearchResponse response = namespace.planSearch(cri, size);
		SearchHits hits = response.getHits();
		
		EsSearchResultVO resultset = new EsSearchResultVO();
		ArrayList<EsPlanVO> result = new ArrayList<EsPlanVO>();
		
		ObjectMapper om = new ObjectMapper(); 
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		for(SearchHit hit : hits) {
	    		String sJson = hit.getSourceAsString();
	    		EsPlanVO plan = om.readValue(sJson, EsPlanVO.class);
	    		result.add(plan);
		}
		
		resultset.setPlanList(result); 
		resultset.setPlanCnt(hits.getTotalHits()); 
		return resultset;
	}
	
	// 일정등록
	@Override
	public void insertEsPlan(PlanVO vo, int planID) throws Exception {

		EsPlanVO esvo = new EsPlanVO();
		esvo.setPlan_id(planID);
		esvo.setPlan_title(vo.getPlanTitle());
		esvo.setMember_id(vo.getMemberID());
		esvo.setMember_name(vo.getMemberName());
		esvo.setPlan_endchk(vo.getPlanEndChk());
		esvo.setPlan_enddate(vo.getPlanEndDate());
		esvo.setPlan_like_cnt(vo.getPlanLikeCnt());
		esvo.setPlan_startdate(vo.getPlanStartDate());
		//회원사진 여기에 있으면 회원사진 업데이트 되었을때 일정에 반영 안되니까.. es맵핑부터 수정되야함.
		esvo.setMember_picture("");
		esvo.setMemo_picture_name(vo.getPictureName());

		
//		IndexRequest indexRequest = new IndexRequest("member", "member", Integer.toString(vo.getMemberID()));
//        ObjectMapper om = new ObjectMapper();
//        byte []json = om.writeValueAsBytes(esvo);
//        indexRequest.source(json);
//        IndexResponse r = client.index(indexRequest).actionGet();
//        if (r.isFragment() == true) {
//            System.out.println("Insert Document : " + esvo.getMember_name());
//        }
    }
}

