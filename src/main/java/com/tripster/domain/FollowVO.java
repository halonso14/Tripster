package com.tripster.domain;

public class FollowVO {
	
	//팔로우 당한사람
	private int followID;
	//팔로우 누른사람
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
