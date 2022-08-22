package com.kh.tripick.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.cglib.core.Local;

import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.LocalBoard;

public interface LocalBoardService {
		// 게시판 리스트 조회 + 페이징처리
		// 게시글 총 갯수 조회 (완료)
		int selectListCount();
		// 전체 게시글 리스트(완료)
		ArrayList<LocalBoard> selectList(PageInfo pi);
		// 지역별 게시글 갯수 조회
		int selectLocalListCount(int lcno);
		// 지역별게시글리스트(완료)
		ArrayList<LocalBoard> selectList(PageInfo pi, int lcno);
		
		// 전체 지역정보
		ArrayList<Local> selectLocalcatList();
	
		// 게시글 작성하기 서비스(insert)(미완)
		int insertBoard(LocalBoard b);
		
		// 첨부파일 첨부 (insert)
		int insertAttachment(ComAttachment at);
		
		// 게시글 조회수 증가(완료)
		int increaseCount(int boardNo);
		//게시글 상세 조회
		LocalBoard selectBoard(int boardNo);
		//게시글 첨부파일 조회
		ComAttachment selectAttachment(int boardNo);
		
		// 게시글 삭제 서비스(update)(완료)
		int deleteBoard(int boardNo);
		
		// 게시글 수정 서비스(update)(완료)
		int updateBoard(LocalBoard b);
		
		// 댓글리스트 조회 서비스
		ArrayList<Reply> selectReplyList(int bno);
		
		//댓글 작성 서비스
		int insertReply(Reply r);
		
		// 댓글 신고
		int reportLocalBoardReply(Report report);
		
		// 게시글 신고
		int reportLocalBoardPost(Report report);
		
		
		// 검색 총 갯수 selectSearchCount
		int selectSearchCount(HashMap<String, String> map);
		
		// 검색 selectSearchList
		ArrayList<LocalBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);
	

}
