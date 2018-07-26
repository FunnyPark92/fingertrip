package com.ff.finger.cs.QnA.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADAO qnADao;

	@Override
	public List<QnAVO> selectAll() {
		return qnADao.selectAll();
	}

	@Override
	public int countUpdate(int qnaNo) {
		return qnADao.countUpdate(qnaNo);
	}

	@Override
	public QnAVO selectByNo(int qnaNo) {
		return qnADao.selectByNo(qnaNo);
	}
	
}
