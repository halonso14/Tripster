package com.tripster.domain;

import com.fasterxml.jackson.annotation.JsonFilter;

import com.tripster.domain.MemberVO;

@JsonFilter("EsMemberFilter")
public class EsMemberVO extends MemberVO{

}
