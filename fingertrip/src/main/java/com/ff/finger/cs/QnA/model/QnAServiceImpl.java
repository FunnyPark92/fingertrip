package com.ff.finger.cs.QnA.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.SearchVO;
import com.ff.finger.member.model.MemberVO;

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
	public int reply(QnAVO qnAVo) {
		int cnt=qnADao.updateSortNo(qnAVo.getQnaNo());
		cnt=qnADao.reply(qnAVo);
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

	@Override
	public int qnADelete(int qnaNo) {
		return qnADao.qnADelete(qnaNo);
	}

	@Override
	public int qnaWrite(QnAVO qnAVo) {
		return qnADao.qnaWrite(qnAVo);
	}

	@Override
	public QnAVO selectUp(int groupNo) {
		return qnADao.selectUp(groupNo);
	}

	@Override
	public QnAVO selectDw(int groupNo) {
		return qnADao.selectDw(groupNo);
	}

	@Override
	public int multiDelete(List<QnAVO> list) {
		int cnt=0;
		try {
			for(QnAVO vo : list) {
				int qnaNo = vo.getQnaNo();
				if(qnaNo>0) {
					cnt = qnADao.qnADelete(vo.getQnaNo());
				}
			}
		} catch (RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		return cnt; 
	}

	@Override
	public int agencyReply(QnAVO qnAVo) {
		int cnt=qnADao.updateSortNo(qnAVo.getQnaNo());
		cnt=qnADao.agencyReply(qnAVo);
		return cnt;
	}

	@Override
	public List<QnAVO> agencyWrite(SearchVO searchVo) {
		return qnADao.agencyWrite(searchVo);
	}

	@Override
	public int agencyWritetotalRecord(SearchVO searchVo) {
		return qnADao.agencyWritetotalRecord(searchVo);
	}
}
