package com.kh.tripick.course.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.course.model.vo.LikePlanner;
import com.kh.tripick.course.model.vo.Plan;
import com.kh.tripick.course.model.vo.Planner;

@Repository
public class CourseDao {

	/**
	 * 코스 등록 (1) Planner
	 */
	public int insertPlanner(SqlSession sqlSession, Planner planner) {
		return (sqlSession.insert("courseMapper.insertPlanner", planner)) * planner.getPlannerNo();
	}

	/**
	 * 코스 등록(2) Plan
	 */
	public int insertPlans(SqlSession sqlSession, Map<String, Object> map) {
		return sqlSession.insert("courseMapper.insertPlanList", map);
	}

	/**
	 * 코스 목록(1) 총 게시글 수
	 */
	public int selectCourseListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("courseMapper.selectCourseListCount");
	}

	/**
	 * 코스 목록(2) 코스 목록 가져오기
	 */
	public ArrayList<Planner> selectCourseList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("courseMapper.selectCourseList", null, rowBounds);
	}

	/**
	 * 코스 상세조회(1) 조회수 증가
	 */
	public int increaseCount(SqlSession sqlSession, int pno) {
		return sqlSession.update("courseMapper.increaseCount", pno);
	}

	/**
	 * 코스 상세조회(2) Planner
	 */
	public Planner selectPlanner(SqlSession sqlSession, int pno) {
		return sqlSession.selectOne("courseMapper.selectPlanner", pno);
	}

	/**
	 * 코스 상세조회(3) PlanList
	 */
	public ArrayList<Plan> selectPlanList(SqlSession sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("courseMapper.selectPlanList", pno);
	}

	/**
	 * 관심코스 등록
	 */
	public int insertLikePlanner(SqlSession sqlSession, LikePlanner likePlanner) {
		return sqlSession.insert("courseMapper.insertLikePlanner", likePlanner);
	}

	/**
	 * 관심코스 불러오기
	 */
	public ArrayList<LikePlanner> selectLikePlanner(SqlSession sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("courseMapper.selectLikePlanner", userId);
	}

	/**
	 * 관심등록 해제
	 */
	public int deleteLikePlanner(SqlSession sqlSession, LikePlanner likePlanner) {
		return sqlSession.delete("courseMapper.deleteLikePlanner", likePlanner);
	}

	/**
	 * 댓글 목록
	 */
	public ArrayList<Reply> selectReplyList(SqlSession sqlSession, int plannerNo) {
		return (ArrayList)sqlSession.selectList("courseMapper.selectReplyList", plannerNo);
	}

	/**
	 * 댓글 작성
	 */
	public int insertReply(SqlSession sqlSession, Reply r) {
		return sqlSession.insert("courseMapper.insertReply", r);
	}

}
