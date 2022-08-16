package com.kh.tripick.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Repository;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.community.model.vo.ComAttachment;
import com.kh.tripick.community.model.vo.Mate;

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
		return sqlSession.update("mateMapper.deleteBoard", boardNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Mate m) {
		return sqlSession.update("mateMapper.updateBoard", m);
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
	

}
