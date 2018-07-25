package com.ff.finger.cs.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired BoardDAO boardDao;

	@Override
	public List<Map<String, Object>> selectAllBoard() {
		return boardDao.selectAllBoard();
	}
}
