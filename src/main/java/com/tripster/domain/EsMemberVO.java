package com.tripster.domain;

import java.util.Date;

public class EsMemberVO {
	private int member_id;
	private String member_name;
	private String member_email;
	private String member_sex;
	private String member_picture;
	private Date member_birthday;
	private Date created;
	private Date updated;
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	public String getMember_picture() {
		return member_picture;
	}
	public void setMember_picture(String member_picture) {
		this.member_picture = member_picture;
	}
	public Date getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	@Override
	public String toString() {
		return "EsMemberVO [member_id=" + member_id + ", member_name=" + member_name + ", member_email=" + member_email
				+ ", member_sex=" + member_sex + ", member_picture=" + member_picture + ", member_birthday="
				+ member_birthday + ", created=" + created + ", updated=" + updated + "]";
	}
	
	
}
