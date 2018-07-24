package com.ff.finger.cs.board.model;

import java.util.List;

import com.ff.finger.cs.QnA.model.QnAVO;

public interface BoardDAO {
	public List<QnAVO> selectAllBoard();
}
