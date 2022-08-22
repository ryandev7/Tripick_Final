package com.kh.tripick.course.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.LocalCategory;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
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
	 * 코스 목록(3) 지역 카테고리
	 */
	@Override
	public ArrayList<LocalCategory> selectLocalList() {
		return courseDao.selectLocalList(sqlSession);
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

	/**
	 * 댓글 목록
	 */
	@Override
	public ArrayList<Reply> selectReplyList(int plannerNo) {
		return courseDao.selectReplyList(sqlSession, plannerNo);
	}

	/**
	 * 댓글 작성
	 */
	@Override
	public int insertReply(Reply r) {
		return courseDao.insertReply(sqlSession, r);
	}

	/**
	 * 코스 삭제
	 */
	@Override
	public int deletePlanner(int plannerNo) {
		return courseDao.deletePlanner(sqlSession, plannerNo);
	}

	/**
	 * 댓글 삭제
	 */
	@Override
	public int deleteReply(Reply r) {
		return courseDao.deleteReply(sqlSession, r);
	}

	/**
	 * 코스 메인 - 지역필터(1)
	 */
	@Override
	public int selectFilterListCount(String localName) {
		return courseDao.selectFilterListCount(sqlSession, localName);
	}

	/**
	 * 코스 메인 - 지역필터(2)
	 */
	@Override
	public ArrayList<Planner> selectFilterList(PageInfo pi, String localName) {
		return courseDao.selectFilterList(sqlSession, pi, localName);
	}
	
	/**
	 * 신고여부 확인
	 */
	@Override
	public int reportCheck(Report report) {
		return courseDao.reportCheck(sqlSession, report);
	}	

	/**
	 * 코스 댓글 신고
	 */
	@Override
	public int reportCourseReply(Report report) {
		return courseDao.reportCourseReply(sqlSession, report);
	}

	/**
	 * 코스 수정(1) - Planner 수정
	 */
	@Override
	public int updatePlanner(Planner planner) {
		return courseDao.updatePlanner(sqlSession, planner);
	}

	/**
	 * 코스 수정(2) - 기존의 Plans 삭제
	 */
	@Override
	public int deletePlanList(int plannerNo) {
		return courseDao.deletePlanList(sqlSession, plannerNo);
	}
}
