package com.ff.finger.member.model;

import java.util.List;

public class MemberListVO {
	private List<MemberVO> memberItems;

	@Override
	public String toString() {
		return "MemberListVO [memberItems=" + memberItems + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	public List<MemberVO> getMemberItems() {
		return memberItems;
	}

	public void setMemberItems(List<MemberVO> memberItems) {
		this.memberItems = memberItems;
	}
}
