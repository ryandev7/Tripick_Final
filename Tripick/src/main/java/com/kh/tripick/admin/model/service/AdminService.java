package com.kh.tripick.admin.model.service;

import java.util.ArrayList;

import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.PageInfo;

public interface AdminService {
	
	// 신고 게시글 리스트 페이징처리
	// 신고 세시글 총 갯수 조회
	int selectListCount();
	
	// 신고 리스트 조회
	ArrayList<Report> selectList(PageInfo pi);
	
	// 신고 상세 조회
	Report selectReport(int rptNo);
	
	// 신고  삭제 
	int deleteReport(int rptNo);

}
