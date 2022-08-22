package com.kh.tripick.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.cglib.core.Local;

import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.LocalBoard;
import com.kh.tripick.community.model.vo.Mate;
import com.kh.tripick.community.model.vo.MateMember;

public interface MateBoardService {
	
	// 동행게시글 조회
	// 게시판 총 갯수
	int selectListCount();
	
	// 전체 게시글 리스트
	ArrayList<Mate> selectList(PageInfo pi);
	
	// 전체 지역정보
	ArrayList<Local> selectLocalcatList();
	
	// 동행게시글 작성
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
	
	// 동행 댓글
	// 댓글리스트 조회 서비스
	ArrayList<Reply> selectReplyList(int bno);
	
	//댓글 작성 서비스
	int insertReply(Reply r);
	// 댓글 신고
	int reportMateReply(Report report);
	
	
	
	// 검색 총 갯수 selectSearchCount
	int selectSearchCount(HashMap<String, String> map);
	
	// 검색 selectSearchList
	ArrayList<LocalBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	
	
	// 동행 기능들
	// 동행 신청
	int insertMate(MateMember mm);
	
	// 동행 신청 중복 조회
	int dupChk(MateMember mm);
	
	// 동행 수락 (mate_member 테이블의 status = 'y'로 변경) + 동행 수락 현재인원 추가랑 같이 사용 + 인원체크
	int updateMateOk(MateMember mm);
	
	// 동행 수락 현재인원 추가
	int increaseMateCount(int mateNo);
	
	// 동행 마감 (recruit_status = 'N' 으로 변경)
	int updateMateEnd(Mate m);
	
	// 동행 현재인원 chk 현재인원이 전체인원 넘어갈 수 없음
	//int memberCountChk(int mateNo);
	
	// 보낸 신청 조회
	ArrayList<MateMember> selectApplyList(String userId, PageInfo pi);
	int selectApplyListCount(String userId);
	// 받은 신청 조회
	ArrayList<MateMember> selectGetApplyList(String userId, PageInfo pi);
	int selectGetApplyListCount(String userId);
	// 나의 동행 리스트
	ArrayList<Mate> selectMyList(String userId, PageInfo pi);
	int selectMyListCount(String userId);

	
}
