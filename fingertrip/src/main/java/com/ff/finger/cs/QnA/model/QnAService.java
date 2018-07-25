package com.ff.finger.cs.QnA.model;

import java.util.List;

public interface QnAService {
	public List<QnAVO> selectAll();
	public int countUpdate(int qnaNo);
}
