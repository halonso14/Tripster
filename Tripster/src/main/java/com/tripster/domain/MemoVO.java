package com.tripster.domain;

import java.util.Arrays;
import java.util.List;

public class MemoVO {
	private int planDetailID;
	private String memoContents;
	
	private List<String> memoPictures;

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

	public List<String> getMemoPictures() {
		return memoPictures;
	}

	public void setMemoPictures(List<String> memoPictures) {
		this.memoPictures = memoPictures;
	}

	@Override
	public String toString() {
		return "MemoVO [planDetailID=" + planDetailID + ", memoContents=" + memoContents + ", memoPictures="
				+ memoPictures + "]";
	}


	
	
}
