package com.tripster.persistence;

import java.util.*;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;

import com.tripster.domain.EsMemberVO;
import com.tripster.domain.EsSearchResultVO;
import com.tripster.domain.MemberVO;
import com.tripster.domain.SearchCriteria;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;

import com.tripster.elasticsearch.EsSearchMapper;

@Repository
public class EsMemberDAOimpl implements EsMemberDAO {

	// EsConfig로 Es연결
	private Client client; 
	// Es client 객체 받아오기
	@Autowired
    public EsMemberDAOimpl(Client client) {
        this.client = client;
    }
	
	
	@Inject
	private EsSearchMapper namespace;
	
	// 회원 검색결과 리스트 조회
	@Override
	public EsSearchResultVO getMemberList(SearchCriteria cri, Integer size) throws Exception{
		
		SearchResponse response = namespace.memberSearch(cri, size);
		SearchHits hits = response.getHits();
		
		EsSearchResultVO resultset = new EsSearchResultVO();
		ArrayList<EsMemberVO> result = new ArrayList<EsMemberVO>();
		
		ObjectMapper om = new ObjectMapper(); 
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		for(SearchHit hit : hits) {
	    		String sJson = hit.getSourceAsString();
	    		EsMemberVO member = om.readValue(sJson, EsMemberVO.class);
	    		result.add(member);
		}
		resultset.setMemberList(result); 
		resultset.setMemberCnt(hits.getTotalHits()); 		
		return resultset;
	}

    // 회원 등록 
	@Override
    public void insertEsMember(MemberVO vo) throws Exception{
        
		EsMemberVO esvo = new EsMemberVO();
		esvo.setMember_id(vo.getMemberID());
		esvo.setMember_email(vo.getMemberEmail());
		esvo.setMember_name(vo.getMemberName());
		esvo.setMember_sex(vo.getMemberSex());
		esvo.setMember_birthday(vo.getMemberBirthday());
		esvo.setMember_picture("");
		esvo.setCreated(vo.getCreated());
		esvo.setUpdated(vo.getUpdated());
		
		IndexRequest indexRequest = new IndexRequest("member", "member", Integer.toString(vo.getMemberID()));
        ObjectMapper om = new ObjectMapper();
        byte []json = om.writeValueAsBytes(esvo);
        indexRequest.source(json);
        IndexResponse r = client.index(indexRequest).actionGet();
        if (r.isFragment() == true) {
            System.out.println("Insert Document : " + esvo.getMember_name());
        }
    }
   
    // 회원 수정
	@Override
    public void updateEsMember(MemberVO vo) throws Exception {	
        UpdateRequest updateRequest = new UpdateRequest("member", "member", Integer.toString(vo.getMemberID()));

        Map<String, Object> objectHashMap = new HashMap<String, Object>();
        if(vo.getMemberPicture() != null) { objectHashMap.put("member_picture", vo.getMemberPicture()); }
        updateRequest.doc(objectHashMap);
        
        UpdateResponse r = client.update(updateRequest).actionGet();
        if (r.isFragment() == true) {
            System.out.println("Update Document : " + vo.getMemberID());
        }
    }
	
	
    // 회원 삭제
	@Override
	public void deleteEsMember(String memberID) throws Exception {
        DeleteRequest deleteRequest = new DeleteRequest("member", "member", memberID);
        DeleteResponse r = client.delete(deleteRequest).get();

        if (r.isFragment() == true) {
            System.out.println("Delete Document : " + memberID);
        }
	}
    
}
