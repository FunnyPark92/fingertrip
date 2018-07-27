package com.ff.finger.cs.QnA.model;

import java.util.List;

import com.ff.finger.common.SearchVO;

public interface QnADAO {
	public List<QnAVO> selectAll(SearchVO searchVo);
	public int countUpdate(int qnaNo);
	public QnAVO selectByNo(int qnaNo);
	public String passck(int qnaNo);
	public int QnAtotalRecord(SearchVO searchVo);
}
