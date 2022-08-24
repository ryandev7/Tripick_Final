package com.kh.tripick.mypage.model.service;

import java.util.ArrayList;

import com.kh.tripick.chatting.model.vo.ChatMessage;
import com.kh.tripick.chatting.model.vo.ChatRoom;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.course.model.vo.Planner;
import com.kh.tripick.member.model.vo.Member;
import com.kh.tripick.servicecenter.model.vo.Qna;

public interface MyPageService {

	Member login(String string);

	int memberInfoChange(Member m);

	int deleteMember(Member m);

	ArrayList<Qna> inquiryHistory(String userId, PageInfo pi);

	int getInquiryCount(String userId);

	int getMyCommentCount(String userId);

	ArrayList<Reply> getMyComments(String userId, PageInfo pi);

	int addWithdrawal(Member m, String withdrawal);

	int selectCourseListCount(String userId);

	ArrayList<Planner> selectMyCourseList(PageInfo pi, String userId);

	int selectInterestCourseListCount(String userId);

	ArrayList<Planner> selectInterestCourseList(PageInfo pi, String userId);

	ArrayList<ChatRoom> getChatRooms(String userId);

	ArrayList<ChatMessage> getChats(String chatRoomNo);

	int insertMsg(ChatMessage cm);

	int addChatRoom(String userId, String myUserId);

}
