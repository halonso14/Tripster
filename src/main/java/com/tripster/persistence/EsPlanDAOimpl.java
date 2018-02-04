package com.tripster.persistence;

import java.util.*;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;

import com.tripster.domain.EsMemberVO;
import com.tripster.domain.EsPlanVO;
import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.PlanDetailVO;
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
		esvo.setMember_id(vo.getMemberID());
		esvo.setMember_name(vo.getMemberName());
		if(vo.getMemberPictureName()!=null) {
			esvo.setMember_picture(vo.getMemberPictureName());
		}else {
			esvo.setMember_picture("");
		}
		esvo.setMemo_picture_name("");
		esvo.setPlan_title(vo.getPlanTitle());
		esvo.setPlan_enddate(vo.getPlanEndDate());
		esvo.setPlan_startdate(vo.getPlanStartDate());
		esvo.setPlan_endchk(0);
		esvo.setPlan_like_cnt(0);
		esvo.setCreated(vo.getCreated());
		esvo.setUpdated(vo.getUpdated());

	
		IndexRequest indexRequest = new IndexRequest("plan", "plan", Integer.toString(vo.getPlanID()));
        ObjectMapper om = new ObjectMapper();
        byte []json = om.writeValueAsBytes(esvo);
        indexRequest.source(json);
        IndexResponse r = client.index(indexRequest).actionGet();
        if (r.isFragment() == true) {
            System.out.println("Insert Document : " + esvo.getPlan_title());
        }
    }
	
    // 일정상세의 사진이 등록될때 일정대표사진으로 업데이트 
	@Override
    public void updateEsPlan(String planID, String pictureName) throws Exception {	
        UpdateRequest updateRequest = new UpdateRequest("plan", "plan", planID);

        Map<String, Object> objectHashMap = new HashMap<String, Object>();
    		objectHashMap.put("memo_picture_name", pictureName); 
        updateRequest.doc(objectHashMap);
        
        UpdateResponse r = client.update(updateRequest).actionGet();
        if (r.isFragment() == true) {
            System.out.println("Update Document : " +planID);
        }
    }
	
	
	// 일정삭제.
	@Override
	public void deleteEsPlan(String planID) throws Exception {
        DeleteRequest deleteRequest = new DeleteRequest("plan", "plan", planID);
        DeleteResponse r = client.delete(deleteRequest).get();

        if (r.isFragment() == true) {
            System.out.println("Delete Document : " + planID);
        }
	}
}

