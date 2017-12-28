package com.tripster.domain;

import java.util.*;
import lombok.*;
//lombok 설치방법 (http://countryxide.tistory.com/16)
import org.springframework.format.annotation.DateTimeFormat;

@Data 
public class MemberVO {
	
	private int memberID;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String memberSex;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date memberBirthday;
	private String memberPicture;
	private String sessionKey;
	private String memberAuthKey;
	
}
