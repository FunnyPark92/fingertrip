package com.ff.finger.course.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;
import com.ff.finger.travelspot.model.TravelSpotVO;

@Repository
public class CourseDAOMybatis implements CourseDAO{
	private String namespace="config.mybatis.mapper.oracle.course.";
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> nacojjaList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"nacojjaList", searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);
	}
	
	@Override
	public int nacojjaCourseWrite(CourseVO travelSpotVo) {
		return sqlSession.insert(namespace + "nacojjaCourseWrite", travelSpotVo);
	}

	@Override
	public int nacojjaTravelSpotWrite(CourseVO travelSpotVo) {
		return sqlSession.insert(namespace + "nacojjaTravelSpotWrite", travelSpotVo);
	}

	@Override
	public List<CourseVO> myWriteSelectAll(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"myWriteSelectAll", searchVo);
	}

	@Override
	public int myWriteCoursetotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"myWriteCoursetotalRecord", searchVo);
	}

	@Override
	public Map<String, Object> selectCourseProgress(int courseNo) {
		return sqlSession.selectOne(namespace+"selectCourseProgress", courseNo);
	}

	@Override
	public CourseVO selectOneCourse(int courseNo) {
		return sqlSession.selectOne(namespace+"selectOneCourse",courseNo);
	}

	@Override
	public int selectMaxDay(int courseNo) {
		return sqlSession.selectOne(namespace+"selectMaxDay", courseNo);
	}

	@Override
	public int updateProgress(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateProgress", map);
	}

	@Override
	public Map<String, Object> selectOneCTJoin(int courseNo) {
		return sqlSession.selectOne(namespace+"selectOneCTJoin",courseNo);
	}

	@Override
	public List<TravelSpotVO> selectListTravelSpot(CourseVO vo) {
		return sqlSession.selectList(namespace+"selectListTravelSpot",vo);
	}
				
	@Override
	public List<CourseVO> selectProgress(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectProgress", searchVo);
	}

	@Override
	public int getTotalRecordByPrgs(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecordByPrgs", searchVo);
	}

	@Override
	public Map<String, Object> selectMember(int courseNo) {
		return sqlSession.selectOne(namespace+"selectMember", courseNo);
	}
	
	@Override
	public List<TravelSpotVO> selectTravelSpot(int courseNo) {
		return sqlSession.selectList(namespace + "selectTravelSpot", courseNo);
	}

	@Override
	public List<Map<String, Object>> selectListJoinMember(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectListJoinMember",searchVo);
	}

	@Override
	public Map<String, Object> selectOneJoinMember(int courseNo) {
		return sqlSession.selectOne(namespace+"selectOneJoinMember", courseNo);
	}	
	
	public int ProgressNo2(int courseNo) {
		return sqlSession.update(namespace+"ProgressNo2",courseNo);
	}

	@Override
	public List<Map<String, Object>> selectListJoinPayBid(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectListJoinPayBid", searchVo);
	}

	@Override
	public List<CourseVO> selectCourse(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectCourse", searchVo);
	}

}
