package com.tripster.domain;

import lombok.*;

import com.fasterxml.jackson.annotation.JsonFilter;

@Data 
@JsonFilter("EsContentsFilter")
public class EsContentsDetailVO {
	private String contentsDetail;
}
