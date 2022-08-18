package com.kh.tripick.servicecenter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.servicecenter.model.vo.Qna;

@Repository
public class QnaDao {

	public int selectQnaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaMapper.selectQnaListCount");
	}

	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaList", null, rowBounds);
	}

	public Qna selectQna(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("qnaMapper.selectQna", qno);
	}

	public int insertQnaAnswer(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("qnaMapper.insertQnaAnswer", q);
	}

	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("qnaMapper.insertQna", q);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.update("qnaMapper.deleteQna", qno);
	}

	public int updateQna(SqlSessionTemplate sqlSession, Qna q) {
		System.out.println("hello");
		return sqlSession.update("qnaMapper.updateQna", q);
	}

	public int deleteAnswer(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.update("qnaMapper.deleteAnswer", qno);
	}

	public int updateQnaAnswer(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("qnaMapper.updateQnaAnswer", q);
	}

	public ArrayList<Qna> selectMyQnaList(SqlSessionTemplate sqlSession, String qnaWriter) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectMyQnaList", qnaWriter);
	}

/*
	public int selectMyQnaListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("qnaMapper.selectMyQnaListCount", userId);
	}

	public ArrayList<Qna> selectMyQnaList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectMyQnaList", userId, rowBounds);
	}
	*/
	
}
