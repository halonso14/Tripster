package com.tripster.domain;

public class MemoPictureVO {
	private int memoPictureID;
	private int planDetailID;
	private String memoPictureName;
	
	//setter/ getter()
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
	public String getMemoPictureName() {
		return memoPictureName;
	}
	public void setMemoPictureName(String memoPictureName) {
		this.memoPictureName = memoPictureName;
	}
	
	//toString();
	@Override
	public String toString() {
		return "MemoPictureVO [memoPictureID=" + memoPictureID + ", planDetailID=" + planDetailID + ", memoPictureName=" + memoPictureName
				+ "]";
	}
	
	
}
