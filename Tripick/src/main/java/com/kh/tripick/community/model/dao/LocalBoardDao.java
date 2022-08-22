package com.kh.tripick.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Repository;

import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.LocalBoard;

@Repository
public class LocalBoardDao {
	
	// 조회
	// 게시글 총 갯수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("localBoardMapper.selectListCount");
	}
	// 지역별 게시글 총 갯수
	public int selectLocalListCount(SqlSessionTemplate sqlSession, int lcode) {
		return sqlSession.selectOne("localBoardMapper.selectLocalListCount", lcode);
	}
	// 전체 게시글 리스트
	public ArrayList<LocalBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("localBoardMapper.selectList", null, rowBounds);
	}
	//지역별 게시판 정렬
	public ArrayList<LocalBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int lcode){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("localBoardMapper.localSelectList", lcode, rowBounds);
	}
	
	public ArrayList<Local> selectLocalcatList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("localBoardMapper.selectLocalcatList");
	}
	
	// 작성
	public int insertBoard(SqlSessionTemplate sqlSession, LocalBoard b) {
		return sqlSession.insert("localBoardMapper.insertBoard", b);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, ComAttachment at) {
		return sqlSession.insert("localBoardMapper.insertAttachment", at);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("localBoardMapper.increaseCount", boardNo);
	}
	
	public LocalBoard selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("localBoardMapper.selectBoard", boardNo);
	}
	public ComAttachment selectAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("localBoardMapper.selectAttachment", boardNo);
	}
	
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("localBoardMapper.deleteBoard", boardNo);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, LocalBoard b) {
		return sqlSession.update("localBoardMapper.updateBoard", b);
	}
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("localBoardMapper.selectReplyList", bno);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("localBoardMapper.insertReply", r);
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("localBoardMapper.selectSearchCount", map);
	}
	public ArrayList<LocalBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("localBoardMapper.selectSearchList", map, rowBounds);
	}
	public int reportLocalBoardReply(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.insert("localBoardMapper.reportLocalBoardReply", report);
	}
	public int reportLocalBoardPost(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.insert("localBoardMapper.reportLocalBoardPost", report);
	}

}
