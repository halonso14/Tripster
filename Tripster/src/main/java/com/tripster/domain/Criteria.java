package com.tripster.domain;

//페이지에 표시되는 컨텐츠 리스트 관리 클래스
public class Criteria {
	//현재 페이지 번호
	private int curPage;
	//페이지 당 컨텐츠 수
	private int contentsPerPage;
	
	public Criteria() {
		this.curPage = 1;
		this.contentsPerPage = 5;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		//유효성 검사
		if(curPage <= 0) {
			this.curPage = 1;
			return;
		}
		
		this.curPage = curPage;
	}

	public int getContentsPerPage() {
		return contentsPerPage;
	}

	public void setContentsPerPage(int contentsPerPage) {
		//유효성 검사
		if(contentsPerPage <= 0 || contentsPerPage > 100) {
			this.contentsPerPage = 20;
		}
		
		this.contentsPerPage = contentsPerPage;		
	}
	
	//현재 목록의 시작 번호
	public int getStartNum() {
		return (this.curPage - 1) * contentsPerPage;
	}

	@Override
	public String toString() {
		return "Criteria [curPage=" + curPage + ", contentsPerPage=" + contentsPerPage + "]";
	}
}