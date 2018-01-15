package com.tripster.domain;

import java.util.Date;

public class ScrapVO {
	
	private int scrapID;
	private int memberID;
	private int categoryID;
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	private int contentsID;
	private int rating;
	private String contentsTitle;
	private String contentsPhoto;
	private Date created;
	private Date updated;
	
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
	
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
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
		return "ScrapVO [scrapID=" + scrapID + ", memberID=" + memberID + ", categoryID=" + categoryID + ", contentsID="
				+ contentsID + ", rating=" + rating + ", contentsTitle=" + contentsTitle + ", contentsPhoto="
				+ contentsPhoto + ", created=" + created + ", updated=" + updated + "]";
	}
	
	
	
	
}
