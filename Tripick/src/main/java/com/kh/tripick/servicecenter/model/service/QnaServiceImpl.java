package com.kh.tripick.servicecenter.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.servicecenter.model.dao.QnaDao;
import com.kh.tripick.servicecenter.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public int selectQnaListCount() {
		return qnaDao.selectQnaListCount(sqlSession);
	}

	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		return qnaDao.selectQnaList(sqlSession, pi);
	}

	@Override
	public int insertQna(Qna q) {
		return qnaDao.insertQna(sqlSession, q);
	}

	@Override
	public Qna selectQna(int qno) {
		return qnaDao.selectQna(sqlSession, qno);
	}

	@Override
	public int deleteQna(int qno) {
		return qnaDao.deleteQna(sqlSession, qno);
	}

	@Override
	public int updateQna(Qna q) {
		System.out.println("hello");
		return qnaDao.updateQna(sqlSession, q);
	}

	@Override
	public int insertQnaAnswer(Qna q) {
		return qnaDao.insertQnaAnswer(sqlSession, q);
	}

	@Override
	public int deleteAnswer(int qno) {
		return qnaDao.deleteAnswer(sqlSession, qno);
	}

	@Override
	public int updateQnaAnswer(Qna q) {
		return qnaDao.updateQnaAnswer(sqlSession, q);
	}

	@Override
	public ArrayList<Qna> selectMyQnaList( String qnaWriter) {
		return qnaDao.selectMyQnaList(sqlSession, qnaWriter);
	}

/*
	@Override
	public int selectMyQnaListCount(String userId) {
		return qnaDao.selectMyQnaListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Qna> selectMyQnaList(String userId, PageInfo pi) {
		return qnaDao.selectMyQnaList(sqlSession, userId, pi);
	}
	*/
	
}
