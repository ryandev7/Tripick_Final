package com.kh.tripick.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.community.model.dao.LocalBoardDao;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.LocalBoard;

@Service
public class LocalBoardServiceImpl implements LocalBoardService {

	@Autowired
	private LocalBoardDao LocalBoardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return LocalBoardDao.selectListCount(sqlSession);
	}
	@Override
	public int selectLocalListCount(int lcno) {
		return LocalBoardDao.selectLocalListCount(sqlSession, lcno);
	}
	@Override
	public ArrayList<LocalBoard> selectList(PageInfo pi) {
		return LocalBoardDao.selectList(sqlSession, pi);
	}
	@Override
	public ArrayList<LocalBoard> selectList(PageInfo pi, int lcno) {
		return LocalBoardDao.selectList(sqlSession, pi, lcno);
	}
	@Override
	public ArrayList<Local> selectLocalcatList() {
		return LocalBoardDao.selectLocalcatList(sqlSession);
	}
	@Override
	public int insertBoard(LocalBoard b) {
		return LocalBoardDao.insertBoard(sqlSession, b);
	}
	@Override
	public int insertAttachment(ComAttachment at) {
		return LocalBoardDao.insertAttachment(sqlSession, at);
	}
	@Override
	public int increaseCount(int boardNo) {
		return LocalBoardDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public LocalBoard selectBoard(int boardNo) {
		return LocalBoardDao.selectBoard(sqlSession, boardNo);
	}
	@Override
	public ComAttachment selectAttachment(int boardNo) {
		return LocalBoardDao.selectAttachment(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return LocalBoardDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(LocalBoard b) {
		return LocalBoardDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		return LocalBoardDao.selectReplyList(sqlSession, bno) ;
	}

	@Override
	public int insertReply(Reply r) {
		return LocalBoardDao.insertReply(sqlSession, r);
	}


	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return 0;
	}
	@Override
	public ArrayList<LocalBoard> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return null;
	}



	
}
