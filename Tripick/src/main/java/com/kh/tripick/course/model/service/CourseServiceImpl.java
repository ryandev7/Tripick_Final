package com.kh.tripick.course.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.course.model.dao.CourseDao;
import com.kh.tripick.course.model.vo.LikePlanner;
import com.kh.tripick.course.model.vo.Plan;
import com.kh.tripick.course.model.vo.Planner;

@Service
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private CourseDao courseDao;
	
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 코스 등록 (1) Planner
	 */
	@Override
	public int insertPlanner(Planner planner) {
		return courseDao.insertPlanner(sqlSession, planner);
	}

	/**
	 * 코스 등록(2) Plan
	 */
	@Override
	public int insertPlanList(Map<String, Object> map) {
		return courseDao.insertPlans(sqlSession, map);
	}

	/**
	 * 코스 목록(1) 총 게시글 수
	 */
	@Override
	public int selectCourseListCount() {
		return courseDao.selectCourseListCount(sqlSession);
	}

	/**
	 * 코스 목록(2) 코스 목록 가져오기
	 */
	@Override
	public ArrayList<Planner> selectCourseList(PageInfo pi) {
		return courseDao.selectCourseList(sqlSession, pi);
	}

	/**
	 * 코스 상세조회(1) 조회수 증가
	 */
	@Override
	public int increaseCount(int pno) {
		return courseDao.increaseCount(sqlSession, pno);
	}

	/**
	 * 코스 상세조회(2) Planner
	 */
	@Override
	public Planner selectPlanner(int pno) {
		return courseDao.selectPlanner(sqlSession, pno);
	}

	/**
	 * 코스 상세조회(3) PlanList
	 */
	@Override
	public ArrayList<Plan> selectPlanList(int pno) {
		return courseDao.selectPlanList(sqlSession, pno);
	}

	/**
	 * 관심코스 등록
	 */
	@Override
	public int insertLikePlanner(LikePlanner likePlanner) {
		return courseDao.insertLikePlanner(sqlSession, likePlanner);
	}
	
	/**
	 * 관심코스 불러오기
	 */
	@Override
	public ArrayList<LikePlanner> selectLikePlanner(String userId) {
		return courseDao.selectLikePlanner(sqlSession, userId);
	}

	/**
	 * 관심코스 해제
	 */
	@Override
	public int deleteLikePlanner(LikePlanner likePlanner) {
		return courseDao.deleteLikePlanner(sqlSession, likePlanner);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
