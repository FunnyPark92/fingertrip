package com.ff.finger.cs.board.model;

import java.util.List;

import com.ff.finger.common.SearchVO;

public interface BoardDAO {
	public List<BoardVO> selectAllBoard(SearchVO searchVO);
	public int countUpdateboard(int boardNo);
	public int totalRecord(SearchVO searchVo);
}
