package com.tripster.domain;

public class ScrapVO {
	
	private int scrapID;
	private int memberID;
	private int codeID;
	private int contentsID;
	private String contentsTitle;
	private String contentsPhoto;
	
	public int getScrapID() {
		return scrapID;
	}
	public void setScrapID(int scrapID) {
		this.scrapID = scrapID;
	}
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public int getCodeID() {
		return codeID;
	}
	public void setCodeID(int codeID) {
		this.codeID = codeID;
	}
	public int getContentsID() {
		return contentsID;
	}
	public void setContentsID(int contentsID) {
		this.contentsID = contentsID;
	}
	public String getContentsTitle() {
		return contentsTitle;
	}
	public void setContentsTitle(String contentsTitle) {
		this.contentsTitle = contentsTitle;
	}
	public String getContentsPhoto() {
		return contentsPhoto;
	}
	public void setContentsPhoto(String contentsPhoto) {
		this.contentsPhoto = contentsPhoto;
	}
	
	@Override
	public String toString() {
		return "ScrapVO [scrapID=" + scrapID + ", memberID=" + memberID + ", codeID=" + codeID + ", contentsID="
				+ contentsID + ", contentsTitle=" + contentsTitle + ", contentsPhoto=" + contentsPhoto + "]";
	}
	
}
