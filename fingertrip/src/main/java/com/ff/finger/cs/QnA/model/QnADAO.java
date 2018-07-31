package com.ff.finger.cs.QnA.model;

import java.util.List;

import com.ff.finger.common.SearchVO;

public interface QnADAO {
	public List<QnAVO> selectAll(SearchVO searchVo);
	public int countUpdate(int qnaNo);
	//상세보기에서 이전글과 다음글을 하기 위해 list에는 VO가 3개가 들어있음
	public List<QnAVO> selectByNo(int qnaNo);
	public String passck(int qnaNo);
	public int QnAtotalRecord(SearchVO searchVo);
	//답글화면을 위한 VO한개만 들어있음
	public QnAVO selectByNoOne(int qnaNo);
	public int updateSortNo(int qnaNo);
	public int reply(QnAVO vo);
	
}
