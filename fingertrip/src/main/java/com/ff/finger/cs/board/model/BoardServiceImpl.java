package com.ff.finger.cs.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired BoardDAO boardDao;

	@Override
	public List<BoardVO> selectAllBoard(SearchVO searchVo) {
		return boardDao.selectAllBoard(searchVo);
	}

	@Override
	public int totalRecord(SearchVO searchVo) {
		return boardDao.totalRecord(searchVo);
	}
	
	@Override
	public int countUpdateboard(int boardNo) {
		return boardDao.countUpdateboard(boardNo);
	}

	
}
