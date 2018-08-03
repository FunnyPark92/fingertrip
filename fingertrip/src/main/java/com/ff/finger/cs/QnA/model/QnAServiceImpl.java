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
	public List<QnAVO> selectByNo(int groupNo) {
		return qnADao.selectByNo(groupNo);
	}

	@Override
	public String passck(int qnaNo) {
		return qnADao.passck(qnaNo);
	}

	@Override
	public int QnAtotalRecord(SearchVO searchVo) {
		return qnADao.QnAtotalRecord(searchVo);
	}

	@Override
	public QnAVO selectByNoOne(int qnaNo) {
		return qnADao.selectByNoOne(qnaNo);
	}

	@Override
	public int reply(QnAVO vo) {
		int cnt=qnADao.updateSortNo(vo.getQnaNo());
		cnt=qnADao.reply(vo);
		return cnt;
	}

	@Override
	public int serchGroupNo(int qnaNo) {
		return qnADao.serchGroupNo(qnaNo);
	}

	@Override
	public List<QnAVO> myWriteSelectAll(SearchVO searchVo) {
		return qnADao.myWriteSelectAll(searchVo);
	}

	@Override
	public int myWriteQnAtotalRecord(SearchVO searchVo) {
		return qnADao.myWriteQnAtotalRecord(searchVo);
	}
}
