package com.tripster.domain;

public class MemoPictureVO {
	private int memoPictureID;
	private int planDetailID;
	private String pictureName;
	
	public int getMemoPictureID() {
		return memoPictureID;
	}
	public void setMemoPictureID(int memoPictureID) {
		this.memoPictureID = memoPictureID;
	}
	public int getPlanDetailID() {
		return planDetailID;
	}
	public void setPlanDetailID(int planDetailID) {
		this.planDetailID = planDetailID;
	}
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	@Override
	public String toString() {
		return "MemoPictureVO [memoPictureID=" + memoPictureID + ", planDetailID=" + planDetailID + ", pictureName="
				+ pictureName + "]";
	}

}
