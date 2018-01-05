package com.tripster.domain;

public class FollowVO {
	
	private int followID;
	private int memberID;
	
	public int getFollowID() {
		return followID;
	}
	public void setFollowID(int followID) {
		this.followID = followID;
	}
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	
	@Override
	public String toString() {
		return "FollowVO [followID=" + followID + ", memberID=" + memberID + "]";
	}

}
