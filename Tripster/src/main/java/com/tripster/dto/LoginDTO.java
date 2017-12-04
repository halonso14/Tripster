package com.tripster.dto;

public class LoginDTO {

	private String memberID;
	private String memberPassword;
	private boolean useCookie;
	
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [memberID=" + memberID + ", memberPassword=" + memberPassword + ", useCookie=" + useCookie
				+ "]";
	}
	
}
