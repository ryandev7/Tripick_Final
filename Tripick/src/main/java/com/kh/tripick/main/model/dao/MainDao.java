package com.kh.tripick.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tripick.tripboard.model.vo.TripBoard;

@Repository
public class MainDao {

	public ArrayList<TripBoard> selectRandomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.randomList");
	}

	public ArrayList<TripBoard> countPlannerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.countList");
	}

}
