package com.kh.tripick.admin.model.service;

import java.util.ArrayList;

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

	@Override
	public ArrayList<Report> selectList(PageInfo pi) {
		return adminDao.selectList(sqlSession, pi);
	}

	@Override
	public Report selectReport(int rptNo) {
		return null;
	}

	@Override
	public int deleteReport(int rptNo) {
		return 0;
	}

}
