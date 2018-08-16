package com.ff.finger.cs.QnA.model;

import java.util.List;

public class QnAListVO {
	private List<QnAVO> qnAItems;

	public List<QnAVO> getQnAItems() {
		return qnAItems;
	}

	public void setQnAItems(List<QnAVO> qnAItems) {
		this.qnAItems = qnAItems;
	}

	@Override
	public String toString() {
		return "QnAListVO [qnAItems=" + qnAItems + ", getQnAItems()=" + getQnAItems() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
