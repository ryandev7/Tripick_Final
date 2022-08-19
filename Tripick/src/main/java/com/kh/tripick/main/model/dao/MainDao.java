package com.kh.tripick.main.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.course.model.vo.Planner;
import com.kh.tripick.tripboard.model.vo.TripBoard;

@Repository
public class MainDao {

	public ArrayList<TripBoard> selectRandomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.randomList");
	}

	public ArrayList<TripBoard> countPlannerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.countList");
	}

	public int searchCourseCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("mainMapper.searchCourseCount", keyword);
	}

	public ArrayList<Planner> searchCourseList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("mainMapper.searchCourseList", keyword, rowBounds);
	}



}
