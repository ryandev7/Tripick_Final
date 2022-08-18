package com.kh.tripick.course.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.course.model.vo.LikePlanner;
import com.kh.tripick.course.model.vo.Plan;
import com.kh.tripick.course.model.vo.Planner;

public interface CourseService{
	// 코스 등록
	int insertPlanner(Planner planner);
	int insertPlanList(Map<String, Object> map);
	
	// 코스 메인 - 코스 목록
	int selectCourseListCount();
	ArrayList<Planner> selectCourseList(PageInfo pi);
	
	// 코스 상세페이지
	int increaseCount(int pno);
	Planner selectPlanner(int pno);
	ArrayList<Plan> selectPlanList(int pno);
	
	// 코스 관심등록
	int insertLikePlanner(LikePlanner likePlanner);
	// 코스 관심등록 해제
	int deleteLikePlanner(LikePlanner likePlanner);
	// 관심코스 가져오기
	ArrayList<LikePlanner> selectLikePlanner(String userId);
}
