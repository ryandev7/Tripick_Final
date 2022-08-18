package com.kh.tripick.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
