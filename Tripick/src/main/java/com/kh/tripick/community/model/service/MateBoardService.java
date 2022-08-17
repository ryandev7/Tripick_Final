package com.kh.tripick.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.cglib.core.Local;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.LocalBoard;
import com.kh.tripick.community.model.vo.Mate;

public interface MateBoardService {
	
	// 게시판 총 갯수
	int selectListCount();
	
	// 전체 게시글 리스트
	ArrayList<Mate> selectList(PageInfo pi);
	
	// 전체 지역정보
	ArrayList<Local> selectLocalcatList();
	
	// 게시글 작성
	int insertBoard(Mate m);

	// 첨부파일 첨부
	int insertAttachment(ComAttachment at);
	
	// 조회수 증가
	int increaseCount(int boardNo);
	
	// 게시글 상세조회
	Mate selectBoard(int boarNo);
	
	// 게시글 첨부파일 조회
	ComAttachment selectAttachment(int boardNo);
	
	// 게시글 첨부파일 수정
	int updateAttachment(ComAttachment a);
	
	// 게시글 첨부파일 수정 (기존x 새로운첨부파일 추가)
	int updateNewAttachment(ComAttachment a);

	// 게시글 삭제 서비스(update)(완료)
	int deleteBoard(int boardNo);
	
	// 게시글 수정 서비스(update)(완료)
	int updateBoard(Mate b);
	
	// 댓글리스트 조회 서비스
	ArrayList<Reply> selectReplyList(int bno);
	
	//댓글 작성 서비스
	int insertReply(Reply r);
	
	
	// 검색 총 갯수 selectSearchCount
	int selectSearchCount(HashMap<String, String> map);
	
	// 검색 selectSearchList
	ArrayList<LocalBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	
}
