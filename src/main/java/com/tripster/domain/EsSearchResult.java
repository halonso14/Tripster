package com.tripster.domain;

import java.util.*;

// 통합 검색결과 값 한번에 담기위한 객체 (contentsVO + planVO + memberVO)
public class EsSearchResult {
	
	public List<EsContentsVO> contentsList;

	public List<EsPlanVO> planList;

	public List<EsMemberVO> memberList;

}