package com.tripster.domain;

public class Criteria {
	//현재 페이지
	private int curPage;
	//페이지 당 컨텐츠 수
	private int contentsPerPage;
	
	public Criteria() {
		this.curPage = 1;
		this.contentsPerPage = 20;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
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
