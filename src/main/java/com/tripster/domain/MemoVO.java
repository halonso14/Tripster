package com.tripster.domain;

import java.util.Arrays;
import java.util.List;

public class MemoVO {
	private int planDetailID;
	private String memoContents;
	
	private List<String> memoPictureName;

	public int getPlanDetailID() {
		return planDetailID;
	}

	public void setPlanDetailID(int planDetailID) {
		this.planDetailID = planDetailID;
	}

	public String getMemoContents() {
		return memoContents;
	}

	public void setMemoContents(String memoContents) {
		this.memoContents = memoContents;
	}

	public List<String> getMemoPictureName() {
		return memoPictureName;
	}

	public void setMemoPictureName(List<String> memoPictures) {
		this.memoPictureName = memoPictures;
	}

	@Override
	public String toString() {
		return "MemoVO [planDetailID=" + planDetailID + ", memoContents=" + memoContents + ", memoPictureName="
				+ memoPictureName + "]";
	}


	
	
}
