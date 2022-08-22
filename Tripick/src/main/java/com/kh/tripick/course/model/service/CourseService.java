package com.kh.tripick.course.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.LocalCategory;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
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
	ArrayList<LocalCategory> selectLocalList();
	
	// 코스 상세페이지
	int increaseCount(int pno); // 조회수 올리기
	Planner selectPlanner(int pno);
	ArrayList<Plan> selectPlanList(int pno);
	
	// 관심코스
	int insertLikePlanner(LikePlanner likePlanner); // 관심등록
	int deleteLikePlanner(LikePlanner likePlanner); // 관심등록 삭제
	ArrayList<LikePlanner> selectLikePlanner(String userId); // 관심목록
	
	// 댓글
	ArrayList<Reply> selectReplyList(int plannerNo); // 댓글조회
	int insertReply(Reply r); // 댓글작성
	int deleteReply(Reply r); // 댓글삭제
	
	// 코스 삭제
	int deletePlanner(int plannerNo);
	
	// 코스 메임 - 지역필터
	int selectFilterListCount(String localName);
	ArrayList<Planner> selectFilterList(PageInfo pi, String localName);
	
	// 코스 댓글 신고
	int reportCourseReply(Report report);
	
	// 코스 수정
	int updatePlanner(Planner planner);
	int deletePlanList(int plannerNo);
	
}
