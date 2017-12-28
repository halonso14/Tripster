package com.tripster.domain;

import com.fasterxml.jackson.annotation.JsonFilter;

@JsonFilter("EsContentsFilter")
public class EsContentsDetailVO {
	private String contentsDetail;

	public String getContentsDetail() {
		return contentsDetail;
	}

	public void setContentsDetail(String contentsDetail) {
		this.contentsDetail = contentsDetail;
	}

	@Override
	public String toString() {
		return "EsContentsDetailVO [contentsDetail=" + contentsDetail + "]";
	}
	
}
