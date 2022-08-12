package com.kh.tripick.servicecenter.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.servicecenter.model.dao.NoticeDao;
import com.kh.tripick.servicecenter.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int selectListCount() {
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return noticeDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public int increaseCount(int noticeNo) {
		return noticeDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(sqlSession, n);
	}

}
