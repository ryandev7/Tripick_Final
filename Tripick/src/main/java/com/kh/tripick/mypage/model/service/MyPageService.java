package com.kh.tripick.mypage.model.service;

import java.util.ArrayList;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
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

}
