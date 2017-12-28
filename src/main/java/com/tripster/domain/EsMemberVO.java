package com.tripster.domain;

import lombok.*;

import com.fasterxml.jackson.annotation.JsonFilter;

import com.tripster.domain.MemberVO;

@Data
@JsonFilter("EsMemberFilter")
public class EsMemberVO extends MemberVO{

}
