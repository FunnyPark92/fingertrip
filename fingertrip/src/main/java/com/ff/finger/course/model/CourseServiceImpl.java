package com.ff.finger.course.model;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ff.finger.common.SearchVO;
import com.ff.finger.travelspot.model.TravelSpotVO;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired 
	private CourseDAO courseDao;
	
	@Override
	public List<Map<String, Object>> nacojjaList(SearchVO searchVo) {
		return courseDao.nacojjaList(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return courseDao.getTotalRecord(searchVo);
	}

	@Override
	@Transactional
	public int nacojjaWrite(CourseVO travelSpotVo, List<Map<String, TravelSpotVO>> travelSpotListById, String userid) {
		int cnt = 0;
		
		//코스 테이블에 먼저 insert
		cnt = courseDao.nacojjaCourseWrite(travelSpotVo);
		//System.out.println("[goni]" + travelSpotVo.getCourseNo());
		
		//상속 구조로 인해 코스 넘버를 이미 갖고있으므로 그대로 여행지 테이블에 다시 insert
		for (int i=0; i<travelSpotListById.size(); i++) {
			travelSpotListById.get(i).get(userid).setCourseNo(travelSpotVo.getCourseNo());
			System.out.println("[goni]" + travelSpotListById.get(i).get(userid));
			cnt = courseDao.nacojjaTravelSpotWrite(travelSpotListById.get(i).get(userid));
		}
		
		
		/*for (int i=0; i<travelSpotList.size(); i++) {
			travelSpotList.get(i).setCourseNo(travelSpotVo.getCourseNo());
			//System.out.println("[goni]" + travelSpotList.get(i));
			cnt = courseDao.nacojjaTravelSpotWrite(travelSpotList.get(i));
		}*/
		
		return cnt;
	}

	@Override
	public List<CourseVO> myWriteSelectAll(SearchVO searchVo) {
		return courseDao.myWriteSelectAll(searchVo);
	}

	@Override
	public int myWriteCoursetotalRecord(SearchVO searchVo) {
		return courseDao.myWriteCoursetotalRecord(searchVo);
	}

	@Override
	public Map<String, Object> selectCourseProgress(int courseNo) {
		return courseDao.selectCourseProgress(courseNo);
	}

	@Override
	public CourseVO selectOneCourse(int courseNo) {
		return courseDao.selectOneCourse(courseNo);
	}

	@Override
	public int selectMaxDay(int courseNo) {
		return courseDao.selectMaxDay(courseNo);
	}

	@Override
	public int updateProgress(Map<String, Object> map) {
		return courseDao.updateProgress(map);
	}

	@Override
	public Map<String, Object> selectOneCTJoin(int courseNo) {
		return courseDao.selectOneCTJoin(courseNo);
	}

	@Override
	public List<TravelSpotVO> selectListTravelSpot(CourseVO vo) {
		return courseDao.selectListTravelSpot(vo);
	}
	@Override
	public List<CourseVO> selectProgress(SearchVO searchVo) {
		return courseDao.selectProgress(searchVo);
	}

	@Override
	public int getTotalRecordByPrgs(SearchVO searchVo) {
		return courseDao.getTotalRecordByPrgs(searchVo);
	}

	@Override
	public Map<String, Object> selectMember(int courseNo) {
		return courseDao.selectMember(courseNo);
	}
	
	@Override
	public List<TravelSpotVO> selectTravelSpot(int courseNo) {
		return courseDao.selectTravelSpot(courseNo);
	}

	@Override
	public int ProgressNo2(int courseNo) {
		return courseDao.ProgressNo2(courseNo);
	}

}
