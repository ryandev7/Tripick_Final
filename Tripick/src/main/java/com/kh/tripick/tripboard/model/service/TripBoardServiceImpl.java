package com.kh.tripick.tripboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.tripboard.model.dao.TripBoardDao;
import com.kh.tripick.tripboard.model.vo.TripAttachment;
import com.kh.tripick.tripboard.model.vo.TripBoard;

@Service
public class TripBoardServiceImpl implements TripBoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TripBoardDao trBoardDao;

	@Override
	public int trBoardListCount() {
		return trBoardDao.trBoardListCount(sqlSession);
	}

	@Override
	public ArrayList<TripBoard> trBoardList(PageInfo pi) {
		return trBoardDao.trBoardList(sqlSession, pi);
	}
	
	@Override
	public int filterTripBoardtCount(String localName) {
		return trBoardDao.filterTripBoardtCount(sqlSession, localName);
	}

	@Override
	public ArrayList<TripBoard> filterTripBoard(PageInfo pi, String localName) {
		return trBoardDao.filterTripBoard(sqlSession, pi, localName);
	}

	/**
	 * 여행지 상세보기 - 게시글 가져오기 (아람)
	 */
	@Override
	public TripBoard selectTripBoard(int trboardNo) {
		return trBoardDao.selectTripBoard(sqlSession, trboardNo);
	}

	/**
	 * 여행지 상세보기 - 첨부파일 가져오기 (아람)
	 */
	@Override
	public ArrayList<TripAttachment> selectTripAttachment(int trboardNo) {
		return trBoardDao.selectTripAttachment(sqlSession, trboardNo);
	}

	

}
