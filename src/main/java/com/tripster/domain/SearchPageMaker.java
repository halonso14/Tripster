package com.tripster.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


public class SearchPageMaker { // 페이지 처리용 객체.
	
	private int totalCount; // DB에서 계산되는 데이터 (전체 게시글 개수)
	
	private int startPage; // 계산을 통해 만들어지는 데이터
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 10; // 한화면에 보여지는 페이지 번호의 숫자 
	private SearchCriteria cri;

	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	public void setCri(SearchCriteria cri) {
		this.cri = cri;
	}
	public SearchCriteria getCri() {
		return cri;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = (int) totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	//GET방식으로 페이지 처리가 복잡해짐 -> makeQuery메소드로 처리 
	//UriComponents :  path나 query에 해당하는 문자열들을 추가해 원하는 URI를 생성해줌.
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("keyword", ((SearchCriteria) cri).getKeyword()).build();
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		if(keyword==null||keyword.trim().length() ==0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		}catch(UnsupportedEncodingException e) {
			return "";
		}
	}
}