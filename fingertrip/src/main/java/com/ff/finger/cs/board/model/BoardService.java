package com.ff.finger.cs.board.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

public interface BoardService {
	public List<BoardVO> selectAllBoard(SearchVO searchVo);
	public int countUpdateboard(int boardNo);
	public int totalRecord(SearchVO searchVo);
}
