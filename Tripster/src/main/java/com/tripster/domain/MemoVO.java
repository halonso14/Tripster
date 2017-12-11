package com.tripster.domain;

public class MemoVO {
	private int memoID;
	private int planDetailID;
	private String momoContents;
	
	
	//setter / getter
	public int getMemoID() {
		return memoID;
	}
	public void setMemoID(int memoID) {
		this.memoID = memoID;
	}
	public int getPlanDetailID() {
		return planDetailID;
	}
	public void setPlanDetailID(int planDetailID) {
		this.planDetailID = planDetailID;
	}
	public String getMomoContents() {
		return momoContents;
	}
	public void setMomoContents(String momoContents) {
		this.momoContents = momoContents;
	}
	
	//toString
	@Override
	public String toString() {
		return "MemoVO [memoID=" + memoID + ", planDetailID=" + planDetailID + ", momoContents=" + momoContents + "]";
	}

}
