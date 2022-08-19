package com.kh.tripick.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.course.model.vo.Planner;
import com.kh.tripick.main.model.dao.MainDao;
import com.kh.tripick.tripboard.model.vo.TripBoard;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MainDao mainDao;

	@Override
	public ArrayList<TripBoard> selectRandomList() {
		return mainDao.selectRandomList(sqlSession);
	}

	@Override
	public ArrayList<TripBoard> countPlannerList() {
		return mainDao.countPlannerList(sqlSession);
	}

	@Override
	public int searchCourseCount(String keyword) {
		return mainDao.searchCourseCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<Planner> searchCourseList(String keyword, PageInfo pi) {
		return mainDao.searchCourseList(sqlSession, keyword, pi);
	}

	

}
