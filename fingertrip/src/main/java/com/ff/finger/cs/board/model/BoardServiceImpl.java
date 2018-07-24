package com.ff.finger.cs.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.cs.QnA.model.QnAVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired BoardDAO boardDao;

	@Override
	public List<BoardVO> selectAllBoard() {
		return boardDao.selectAllBoard();
	}
	
	
}
