package com.ff.finger.cs.QnA.model;

import java.util.List;

import com.ff.finger.common.SearchVO;

public interface QnADAO {
	public List<QnAVO> selectAll(SearchVO searchVo);
	public int countUpdate(int qnaNo);
	//이전글,다음글에서 group_no보내기 위한 메서드
	public int serchGroupNo(int qnaNo);
	public String passck(int qnaNo);
	public int QnAtotalRecord(SearchVO searchVo);
	//답글화면을 위한 VO한개만 들어있음
	public QnAVO selectByNoOne(int qnaNo);
	public int updateSortNo(int qnaNo);
	public int reply(QnAVO qnAVo);
	//내가 쓴글 출력을 위한 메서드
	public List<QnAVO> myWriteSelectAll(SearchVO searchVo);
	public int myWriteQnAtotalRecord(SearchVO searchVo);
	public int qnADelete(int qnaNo);
	public int qnaWrite(QnAVO qnAVo);
	//이전 글 다음을을 선택해오기 위한 두개의 메서드
	public QnAVO selectUp(int groupNo);
	public QnAVO selectDw(int groupNo);
	public int agencyReply(QnAVO qnAVo);
	
	
}
