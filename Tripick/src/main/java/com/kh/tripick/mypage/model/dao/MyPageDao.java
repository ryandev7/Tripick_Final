package com.kh.tripick.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tripick.chatting.model.vo.ChatMessage;
import com.kh.tripick.chatting.model.vo.ChatRoom;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.course.model.vo.Planner;
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

	public int selectCourseListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("myPageMapper.selectCourseListCount", userId);
	}

	public ArrayList<Planner> selectMyCourseList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMyCourseList", userId, rowBounds);
	}

	public int selectInterestCourseListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("myPageMapper.selectInterestCourseListCount", userId);
	}

	public ArrayList<Planner> selectInterestCourseList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectInterestCourseList", userId, rowBounds);
	}

	public ArrayList<ChatRoom> getChatRooms(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("myPageMapper.getChatRooms", userId);
	}

	public ArrayList<ChatMessage> getChats(SqlSessionTemplate sqlSession, String chatRoomNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.getChats", chatRoomNo);
	}

	public int insertMsg(SqlSessionTemplate sqlSession, ChatMessage cm) {
		return sqlSession.insert("myPageMapper.insertMsg", cm);
	}

	public int addChatRoom(SqlSessionTemplate sqlSession, String myUserId) {
		return sqlSession.insert("myPageMapper.addChatRoom", myUserId);
	}

	public int addChatRoomJoin(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.insert("myPageMapper.addChatRoomJoin", userId);
	}

	
	
}
