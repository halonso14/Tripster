package com.tripster.domain;

//페이지 번호 관련 클래스
public class PageMaker {
	//총 게시물 개수
	private int totalCount;
	//시작 페이지 번호
	private int startPage;
	//마지막 페이지 번호
	private int endPage;
	//이전 페이지 번호
	private boolean prev;
	//다음 페이지 번호
	private boolean next;
	
	//페이지 번호 개수
	private int displayPageNum = 2;
	//컨텐츠 리스트 관리 객체
	private Criteria cri;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		//페이지 정보 계산
		calcPage();
	}
	
	//처음,마지막 페이지 번호 계산 및 이전,다음 페이지 버튼 활성화 여부 설정
	private void calcPage() {
		endPage = (int) (Math.ceil(cri.getCurPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		//마지막 페이지 번호 유효성 검사를 위한 변수
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getContentsPerPage()));
		
		//마지막 페이지 번호 최종 결정
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * cri.getContentsPerPage() >= totalCount ? false : true;
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

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
}