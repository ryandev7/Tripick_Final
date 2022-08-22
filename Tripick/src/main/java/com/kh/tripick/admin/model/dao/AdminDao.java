package com.kh.tripick.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.PageInfo;

@Repository
public class AdminDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public int selectReplyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectReplyListCount");
	}
	
	public ArrayList<Report> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Report> selectReplyList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReplyList", null, rowBounds);
	}

	public Report selectBoard(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectBoard", map);
	}
	
	public ArrayList<Report> selectRptList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectRptList", map);
	}


	public int deleteLocalBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.deleteLocalBoard", boardNo);
	}

	public int deleteMateBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.deleteMateBoard", boardNo);
	}
	
	
}
