package com.kh.tripick.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.member.model.vo.Member;
import com.kh.tripick.servicecenter.model.vo.Qna;

@Repository
public class MyPageDao {

	public Member login(SqlSessionTemplate sqlSession, String string) {
		return sqlSession.selectOne("myPageMapper.login", string);
	}

	public int memberInfoChange(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myPageMapper.memberInfoChange", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myPageMapper.deleteMember", m);
	}
	
	public int addWithdrawal(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("myPageMapper.addWithdrawal", m);
	}
	public ArrayList<Qna> inquiryHistory(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.inquiryHistory", userId, rowBounds);
	}

	public int getInquiryCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("myPageMapper.getInquiryCount", userId);

	}

	public int getMyCommentCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("myPageMapper.getMyCommentCount", userId);
	}

	public ArrayList<Reply> getMyComments(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.getMyComments", userId, rowBounds);
	}

	
	
}
