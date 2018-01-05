package com.tripster.dto;

public class LoginDTO {

	private String memberEmail;
	private String memberPassword;
	private boolean useCookie;
	
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [memberEmail=" + memberEmail + ", memberPassword=" + memberPassword + ", useCookie=" + useCookie
				+ "]";
	}
	
}
