package com.tripster.domain;

public class LikeVO {
	
	// 좋아요 식별번호
	private Integer likeID;
	// 일정 식별 번호
	private Integer planID;
	// 좋아요를 누르는 멤버 ID
	private Integer memberID;
	
	public Integer getLikeID() {
		return likeID;
	}
	public void setLikeID(Integer likeID) {
		this.likeID = likeID;
	}
	public Integer getPlanID() {
		return planID;
	}
	public void setPlanID(Integer planID) {
		this.planID = planID;
	}
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	
	@Override
	public String toString() {
		return "LikeVO [likeID=" + likeID + ", planID=" + planID + ", memberID=" + memberID + "]";
	}

}
