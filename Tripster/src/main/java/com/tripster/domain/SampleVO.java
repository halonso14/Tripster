package com.tripster.domain;

public class SampleVO {
	
	private int ff;
	private String str;
	
	@Override
	public String toString() {
		return "SampleVO [ff=" + ff + ", str=" + str + "]";
	}
	public int getFf() {
		return ff;
	}
	public void setFf(int ff) {
		this.ff = ff;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
}
