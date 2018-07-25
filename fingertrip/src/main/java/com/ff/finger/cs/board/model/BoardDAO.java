package com.ff.finger.cs.board.model;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	public List<Map<String, Object>> selectAllBoard();
	public int countUpdateboard(int boardNo);
}
