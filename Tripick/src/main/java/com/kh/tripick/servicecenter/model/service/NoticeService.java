package com.kh.tripick.servicecenter.model.service;

import java.util.ArrayList;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.servicecenter.model.vo.Notice;

public interface NoticeService {
	
	// 공지사항 리스트 조회 + 페이징처리
	// 공지사항 총 개수 조회
	int selectListCount();
	// 공지사항 리스트 조회
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 공지사항 작성
	int insertNotice(Notice n);
	
	// 공지사항 상세 조회 서비
	// 공지사항 조회수 증가
	int increaseCount(int noticeNo);
	// 공지사항 상세 조회
	Notice selectNotice(int noticeNo);
	
	// 공지사항 삭제
	int deleteNotice(int noticeNo);
	
	// 공지사항 수정
	int updateNotice(Notice n);
	
}
