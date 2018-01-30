package com.tripster.domain;

import java.util.*;
public class SearchCriteria{

	private int page; //현재 조회하는 페이지의 번호.
	private int perPageNum; //한 페이지당 출력하는 데이터의 개수.
	private String cnt;
	private String keyword; // 조회 키워드.
	private HashMap<String,String> filter; // 조회 조건 값. 
	private String tab; // 현재 조회하는 탭 이름(통합,컨텐츠,일정,회원)
	
	public SearchCriteria() {
		this.tab="total";
		this.page=1;
		this.perPageNum=10;
	}
	
	public HashMap<String,String> getFilter() {
		return filter;
	}
	public void setFilter(HashMap<String,String> filter) {
		this.filter = filter;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}	

	public String getTab() {
		return tab;
	}
	public void setTab(String tab) {
		this.tab = tab;
	}
	
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
			return;
		}
		this.page=page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0||perPageNum >100) {
			this.perPageNum =10;
			return;
		}
		this.perPageNum =perPageNum;
	}
	
	public void setPerPageNum(int perPageNum, String tab) {
		if(perPageNum<=0||perPageNum >100) {
			if(tab.equals("plan")||tab.equals("member")) {
				this.perPageNum =9;
				return;
			}
		}
		this.perPageNum =perPageNum;
	}
	
	
	//method for MyBatis SQL Mapper -
	public int getPageStart() {
		return (this.page-1) * perPageNum;
	}
	
}