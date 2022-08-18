package com.kh.tripick.servicecenter.model.service;

import java.util.ArrayList;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.servicecenter.model.vo.Notice;
import com.kh.tripick.servicecenter.model.vo.Qna;

public interface QnaService {
	
	// QNA 리스트 조회 + 페이징처리
	// QNA 총 개수 조회
	int selectQnaListCount();
	// QNA 리스트 조회
	ArrayList<Qna> selectQnaList(PageInfo pi);
	
	// QNA 작성
	int insertQna(Qna q);
	
	// QNA 상세 조회
	Qna selectQna(int qno);
	
	// QNA 삭제
	int deleteQna(int qno);
	
	// QNA 수정
	int updateQna(Qna q);
	
	// QNA 답변 작성
	int insertQnaAnswer(Qna q);
	
	// 답변 삭제
	int deleteAnswer(int qno);
	
	// 답변 수정
	int updateQnaAnswer(Qna q);
	
	// 내 Qna만 보기
	ArrayList<Qna> selectMyQnaList(String qnaWriter);
	
	/*
	int selectMyQnaListCount(String userId);
	ArrayList<Qna> selectMyQnaList(String userId, PageInfo pi);
	*/
	
}
