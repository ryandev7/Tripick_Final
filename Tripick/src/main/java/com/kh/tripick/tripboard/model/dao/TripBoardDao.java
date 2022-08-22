package com.kh.tripick.tripboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.tripboard.model.vo.TripAttachment;
import com.kh.tripick.tripboard.model.vo.TripBoard;

@Repository
public class TripBoardDao {

	public int trBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("tripBoardMapper.trBoardListCount");
	}

	public ArrayList<TripBoard> trBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("tripBoardMapper.trBoardList",null, rowBounds);
	}

	public int filterTripBoardtCount(SqlSessionTemplate sqlSession, String localName) {
		return sqlSession.selectOne("tripBoardMapper.filterTripBoardtCount");
	}

	public ArrayList<TripBoard> filterTripBoard(SqlSessionTemplate sqlSession, PageInfo pi, String localName) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("tripBoardMapper.filterTripBoard", localName, rowBounds);
	}

	/**
	 * 여행지 상세보기 - 게시글 가져오기 (아람)
	 */
	public TripBoard selectTripBoard(SqlSessionTemplate sqlSession, int trboardNo) {
		return sqlSession.selectOne("tripBoardMapper.selectTripBoard", trboardNo);
	}

	/**
	 * 여행지 상세보기 - 첨부파일 가져오기 (아람)
	 */
	public ArrayList<TripAttachment> selectTripAttachment(SqlSessionTemplate sqlSession, int trboardNo) {
		return (ArrayList)sqlSession.selectList("tripBoardMapper.selectTripAttachment", trboardNo);
	}

}
