package com.tripster.domain;

public class ContentsVO {
	
	private int codeID;
	private int ID;
	private String title;
	private String location;
	private int rating;
	private String time;
	private String contents;
	private String tel;
	
	public int getCodeID() {
		return codeID;
	}
	public void setCodeID(int codeID) {
		this.codeID = codeID;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "ContentsVO [codeID=" + codeID + ", ID=" + ID + ", title=" + title + ", location=" + location
				+ ", rating=" + rating + ", time=" + time + ", contents=" + contents + ", tel=" + tel + "]";
	}
	
}
