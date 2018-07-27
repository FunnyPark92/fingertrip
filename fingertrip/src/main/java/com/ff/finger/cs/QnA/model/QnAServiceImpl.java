package com.ff.finger.cs.QnA.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.SearchVO;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADAO qnADao;

	@Override
	public List<QnAVO> selectAll(SearchVO searchVo) {
		return qnADao.selectAll(searchVo);
	}

	@Override
	public int countUpdate(int qnaNo) {
		return qnADao.countUpdate(qnaNo);
	}

	@Override
	public QnAVO selectByNo(int qnaNo) {
		return qnADao.selectByNo(qnaNo);
	}

	@Override
	public String passck(int qnaNo) {
		return qnADao.passck(qnaNo);
	}

	@Override
	public int QnAtotalRecord(SearchVO searchVo) {
		return qnADao.QnAtotalRecord(searchVo);
	}
	
}
