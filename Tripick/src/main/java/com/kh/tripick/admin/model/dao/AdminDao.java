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
	
	// ========================== 신고 게시판 영역 =============================
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<Report> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}

	public Report selectBoard(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectBoard", map);
	}
	
	public ArrayList<Report> selectRptList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectRptList", map);
	}
	
	// ============================================================================

	
	
	// ========================== 신고 댓글 영역 =============================
	
	public int selectReplyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectReplyListCount");
	}
	
	public ArrayList<Report> selectReplyList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReplyList", null, rowBounds);
	}
	
	public Report selectReply(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectReply", map);
	}
	
	public ArrayList<Report> selectReplyRptList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectReplyRptList", map);
	}
	
	// ======================================================================
	
	
	
	// ============================= 신고 삭제 영역 ===================================
	
	public int deleteLocalBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.deleteLocalBoard", boardNo);
	}

	public int deleteMateBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.deleteMateBoard", boardNo);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("adminMapper.deleteReply", replyNo);
	}
	// ===========================================================================
	
}
