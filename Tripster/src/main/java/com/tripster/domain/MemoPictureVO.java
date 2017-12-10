package com.tripster.domain;

public class MemoPictureVO {
	private int memoPictureID;
	private int memoID;
	private String pictureName;
	
	//setter/ getter()
	public int getMemoPictureID() {
		return memoPictureID;
	}
	public void setMemoPictureID(int memoPictureID) {
		this.memoPictureID = memoPictureID;
	}
	public int getMemoID() {
		return memoID;
	}
	public void setMemoID(int memoID) {
		this.memoID = memoID;
	}
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	
	//toString();
	@Override
	public String toString() {
		return "MemoPictureVO [memoPictureID=" + memoPictureID + ", memoID=" + memoID + ", pictureName=" + pictureName
				+ "]";
	}
	
	
}
