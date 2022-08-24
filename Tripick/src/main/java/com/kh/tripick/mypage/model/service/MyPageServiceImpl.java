package com.kh.tripick.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.chatting.model.vo.ChatMessage;
import com.kh.tripick.chatting.model.vo.ChatRoom;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.course.model.vo.Planner;
import com.kh.tripick.member.model.vo.Member;
import com.kh.tripick.mypage.model.dao.MyPageDao;
import com.kh.tripick.servicecenter.model.vo.Qna;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDao mypageDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(String string) {
		return mypageDao.login(sqlSession, string);
	}

	@Override
	public int memberInfoChange(Member m) {
		return mypageDao.memberInfoChange(sqlSession, m);
	}

	@Override
	public int deleteMember(Member m) {
		return mypageDao.deleteMember(sqlSession, m);
	}
	
	@Override
	public int addWithdrawal(Member m, String withdrawal) {
		m.setStatus(withdrawal);
		return mypageDao.addWithdrawal(sqlSession, m);
	}

	@Override
	public int getInquiryCount(String userId) {
		return mypageDao.getInquiryCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Qna> inquiryHistory(String userId, PageInfo pi) {
		return mypageDao.inquiryHistory(sqlSession, userId, pi);
	}

	@Override
	public int getMyCommentCount(String userId) {
		return mypageDao.getMyCommentCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Reply> getMyComments(String userId, PageInfo pi) {
		return mypageDao.getMyComments(sqlSession, userId, pi);
	}

	@Override
	public int selectCourseListCount(String userId) {
		return mypageDao.selectCourseListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Planner> selectMyCourseList(PageInfo pi, String userId) {
		return mypageDao.selectMyCourseList(sqlSession, userId, pi);
	}

	@Override
	public int selectInterestCourseListCount(String userId) {
		return mypageDao.selectInterestCourseListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<Planner> selectInterestCourseList(PageInfo pi, String userId) {
		return mypageDao.selectInterestCourseList(sqlSession, userId, pi);
	}

	@Override
	public ArrayList<ChatRoom> getChatRooms(String userId) {
		return mypageDao.getChatRooms(sqlSession, userId);
	}

	@Override
	public ArrayList<ChatMessage> getChats(String chatRoomNo) {
		return mypageDao.getChats(sqlSession, chatRoomNo);
	}

	@Override
	public int insertMsg(ChatMessage cm) {
		return mypageDao.insertMsg(sqlSession, cm);
	}

	@Override
	public int addChatRoom(String userId, String myUserId) {
		int result = 1;
		result *= mypageDao.addChatRoom(sqlSession, myUserId);
		result *= mypageDao.addChatRoomJoin(sqlSession,myUserId);
		result *= mypageDao.addChatRoomJoin(sqlSession,userId);
		return result;
	}

	

}
