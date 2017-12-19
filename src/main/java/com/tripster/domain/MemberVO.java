package com.tripster.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVO {
	
	private int memberID;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date memberBirthday;
	private String memberPicture;
	private String sessionID;
	private String memberAuthkey;
	
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Date getMemberBirthday() {
		return memberBirthday;
	}
	public void setMemberBirthday(Date memberBirthday) {
		this.memberBirthday = memberBirthday;
	}
	public String getMemberPicture() {
		return memberPicture;
	}
	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}
	public String getSessionID() {
		return sessionID;
	}
	public void setSessionID(String sessionID) {
		this.sessionID = sessionID;
	}
	public String getMemberAuthKey() {
		return memberAuthkey;
	}
	public void setMemberAuthKey(String memberAuthKey) {
		this.memberAuthkey = memberAuthKey;
	}
	@Override
	public String toString() {
		return "MemberVO [memberID=" + memberID + ", memberEmail=" + memberEmail + ", memberPassword=" + memberPassword
				+ ", memberName=" + memberName + ", memberBirthday=" + memberBirthday + ", memberPicture="
				+ memberPicture + ", sessionID=" + sessionID + ", memberAuthKey=" + memberAuthkey + "]";
	}
	
}
