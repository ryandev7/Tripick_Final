package com.kh.tripick.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.PageInfo;

public interface AdminService {
	
	// 신고 게시글 리스트 페이징처리
	// 신고 게시글 총 갯수 조회
	int selectListCount();
	
	// 신고 리스트 조회
	ArrayList<Report> selectList(PageInfo pi);
	
	// 신고 상세 조회
	Report selectBoard(HashMap<String, String> map);
	ArrayList<Report> selectRptList(HashMap<String, String> map);
	
	
	
	int selectReplyListCount();
	
	ArrayList<Report> selectReplyList(PageInfo pi);
	
	Report selectReply(HashMap<String, String> map);
	ArrayList<Report> selectReplyRptList(HashMap<String, String> map);
	
	
	// 신고된글  삭제 
	int deleteLocalBoard(int boardNo);

	int deleteMateBoard(int boardNo);

	int deleteReply(int replyNo);





	

	
}
