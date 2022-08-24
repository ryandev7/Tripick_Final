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
import com.kh.tripick.community.model.vo.Mate;
import com.kh.tripick.community.model.vo.MateMember;

@Repository
public class MateBoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mateMapper.selectListCount");
	}

	public ArrayList<Mate> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mateMapper.selectList",null, rowBounds);
	}

	public ArrayList<Local> selectLocalcatList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("localBoardMapper.selectLocalcatList");
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Mate m) {
		return sqlSession.insert("mateMapper.insertBoard", m);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, ComAttachment at) {
		return sqlSession.insert("mateMapper.insertAttachment", at);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("mateMapper.increaseCount", boardNo);
	}

	public ComAttachment selectAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("mateMapper.selectAttachment", boardNo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("mateMapper.deleteMate", boardNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Mate m) {
		return sqlSession.update("mateMapper.updateMate", m);
	}

	public Mate selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("mateMapper.selectBoard", boardNo);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("mateMapper.selectReplyList", bno);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("mateMapper.insertReply", r);
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("mateMapper.selectSearchCount", map);
	}
	public ArrayList<LocalBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mateMapper.selectSearchList", map, rowBounds);
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, ComAttachment a) {
		return sqlSession.update("mateMapper.updateAttachment", a);
	}

	public int updateNewAttachment(SqlSessionTemplate sqlSession, ComAttachment a) {
		return sqlSession.insert("mateMapper.updateNewAttachment", a);
	}

	public int insertMate(SqlSessionTemplate sqlSession, MateMember mm) {
		return sqlSession.insert("mateMapper.mateMemberInsert", mm);
	}

	public int dupChk(SqlSessionTemplate sqlSession, MateMember mm) {
		return sqlSession.selectOne("mateMapper.dupChk", mm);
	}

	public int updateMateOk(SqlSessionTemplate sqlSession, MateMember mm) {
		return sqlSession.update("mateMapper.updateMateOk", mm);
	}

	public int increaseMateCount(SqlSessionTemplate sqlSession, int mateNo) {
		return sqlSession.update("mateMapper.increaseMateCount", mateNo);
	}

	public int updateMateEnd(SqlSessionTemplate sqlSession, Mate m) {
		return sqlSession.update("mateMapper.updateMateEnd", m);
	}
	
	public int memberCountChk(SqlSessionTemplate sqlSession, Mate m) {
		return sqlSession.selectOne("mateMapper.memberCountChk", m);
	}
	

	public ArrayList<MateMember> selectApplyList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("mateMapper.selectApplyList", userId);
	}

	public int selectApplyListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mateMapper.selectApplyListCount", userId);
	}

	public ArrayList<MateMember> selectGetApplyList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("mateMapper.selectGetApplyList", userId);
	}

	public int selectGetApplyListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mateMapper.selectGetApplyListCount", userId);
	}

	public int reportMateReply(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.insert("mateMapper.reportMateReply", report);
	}

	public ArrayList<Mate> selectMyList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("mateMapper.selectMyList", userId);
	}

	public int selectMyListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mateMapper.selectMyListCount", userId);
	}

	public int reportCheck(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.selectOne("mateMapper.reportCheck", report);
	}
	

}
