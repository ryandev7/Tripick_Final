package com.kh.tripick.main.model.service;

import java.util.ArrayList;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.course.model.vo.Planner;
import com.kh.tripick.tripboard.model.vo.TripBoard;

public interface MainService {
	
	ArrayList<TripBoard> selectRandomList();
	
	ArrayList<TripBoard> countPlannerList();

	int searchCourseCount(String keyword);

	ArrayList<Planner> searchCourseList(String keyword, PageInfo pi);

}
