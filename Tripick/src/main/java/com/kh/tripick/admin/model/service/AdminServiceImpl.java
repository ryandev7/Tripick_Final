package com.kh.tripick.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.admin.model.dao.AdminDao;
import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.PageInfo;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public int selectListCount() {
		return adminDao.selectListCount(sqlSession);
	}
	
	public int selectReplyListCount() {
		return adminDao.selectReplyListCount(sqlSession);
	}

	@Override
	public ArrayList<Report> selectList(PageInfo pi) {
		return adminDao.selectList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Report> selectReplyList(PageInfo pi) {
		return adminDao.selectReplyList(sqlSession, pi);
	}

	@Override
	public Report selectBoard(HashMap<String, String> map) { 
		return adminDao.selectBoard(sqlSession, map);
	}
	
	@Override
	public ArrayList<Report> selectRptList(HashMap<String, String> map) {
		//String boardNo, String divCode
		return adminDao.selectRptList(sqlSession, map);
	}


	@Override
	public int deleteLocalBoard(int boardNo) {
		return adminDao.deleteLocalBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteMateBoard(int boardNo) {
		return adminDao.deleteMateBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteReply(int boardNo) {
		return 0;
	}
	

}
