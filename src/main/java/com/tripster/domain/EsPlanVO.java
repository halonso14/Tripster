package com.tripster.domain;

import java.util.Date;

public class EsPlanVO {
	private int plan_id;
	private int member_id;
	private String member_name;
	private String plan_title;
	private int plan_endchk;
	private Date plan_startdate;
	private Date plan_enddate;
	private Date created;
	private Date updated;
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
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
	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	public int getPlan_endchk() {
		return plan_endchk;
	}
	public void setPlan_endchk(int plan_endchk) {
		this.plan_endchk = plan_endchk;
	}
	public Date getPlan_startdate() {
		return plan_startdate;
	}
	public void setPlan_startdate(Date plan_startdate) {
		this.plan_startdate = plan_startdate;
	}
	public Date getPlan_enddate() {
		return plan_enddate;
	}
	public void setPlan_enddate(Date plan_enddate) {
		this.plan_enddate = plan_enddate;
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
		return "EsPlanVO [plan_id=" + plan_id + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", plan_title=" + plan_title + ", plan_endchk=" + plan_endchk + ", plan_startdate=" + plan_startdate
				+ ", plan_enddate=" + plan_enddate + ", created=" + created + ", updated=" + updated + "]";
	}
}