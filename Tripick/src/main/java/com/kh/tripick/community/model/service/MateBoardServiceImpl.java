package com.kh.tripick.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.community.model.dao.MateBoardDao;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.LocalBoard;
import com.kh.tripick.community.model.vo.Mate;

@Service
public class MateBoardServiceImpl implements MateBoardService{

	@Autowired
	private MateBoardDao mateBoardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return mateBoardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Mate> selectList(PageInfo pi) {
		return mateBoardDao.selectList(sqlSession, pi);
	}

	@Override
	public ArrayList<Local> selectLocalcatList() {
		return mateBoardDao.selectLocalcatList(sqlSession);
	}

	@Override
	public int insertBoard(Mate m) {
		return mateBoardDao.insertBoard(sqlSession, m);
	}

	@Override
	public int insertAttachment(ComAttachment at) {
		return mateBoardDao.insertAttachment(sqlSession, at);
	}

	@Override
	public int increaseCount(int boardNo) {
		return mateBoardDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Mate selectBoard(int boardNo) {
		return mateBoardDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public ComAttachment selectAttachment(int boardNo) {
		return mateBoardDao.selectAttachment(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return mateBoardDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Mate b) {
		return mateBoardDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		return mateBoardDao.selectReplyList(sqlSession, bno) ;
	}

	@Override
	public int insertReply(Reply r) {
		return mateBoardDao.insertReply(sqlSession, r);
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return mateBoardDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<LocalBoard> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return mateBoardDao.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public int updateAttachment(ComAttachment a) {
		return mateBoardDao.updateAttachment(sqlSession, a);
	}

	@Override
	public int updateNewAttachment(ComAttachment a) {
		return mateBoardDao.updateNewAttachment(sqlSession, a);
	}



}
