package com.kh.tripick.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.tripick.chatting.model.vo.ChatMessage;
import com.kh.tripick.chatting.model.vo.ChatRoom;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.course.model.vo.Planner;
import com.kh.tripick.member.model.service.MemberService;
import com.kh.tripick.member.model.vo.Member;
import com.kh.tripick.mypage.model.service.MyPageService;
import com.kh.tripick.servicecenter.model.vo.Qna;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService mypageService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("mypage.my")
	public String mypage() {
		return "mypage/myPageMenu";
	}

	
	//회원정보수정 관련
	@RequestMapping("memInfoChanForm.my")
	public String memberInfoChangeForm() {
		return "mypage/memberInfoChangeForm";
	}
	
	@RequestMapping("changeMemInfo.my")
	public String memberInfoChange(Member m, HttpSession session) {

		m.setUserPwd(bcryptPasswordEncoder.encode(m.getUserPwd()));
		int result = mypageService.memberInfoChange(m);
		
		if(result > 0) {
			session.setAttribute("loginUser", m);
			return "redirect:/";
		} else {
			//errorpage
			return "";
		}
	}
	
	@ResponseBody
	@RequestMapping("passchk.my")
	public String passChk(HttpSession session, String pass) {
		Member m = (Member) session.getAttribute("loginUser");
		
		return bcryptPasswordEncoder.matches(pass, m.getUserPwd()) ? "Y" : "N";
	}
		

	
	//회원탈퇴 관련
	@RequestMapping("deleteMemberForm.my")
	public String deleteMemberForm() {
		return "mypage/deleteMemberForm";
	}
	@RequestMapping("deleteMember.my")
	public String deleteMember(Member m, String withdrawal, HttpSession session) {
		
		int result1 = mypageService.deleteMember(m);
		int result2 = mypageService.addWithdrawal(m,withdrawal);
		
		
		if(result1*result2 > 0) {
			session.removeAttribute("loginUser");
			return "main";
		} else {
			//errorpage
			return "";
		}
	}
	
	//문의내역 기능
	@RequestMapping("inquiryhis.my")
	public String inquiryHistory(HttpSession session, @RequestParam(value="page", defaultValue = "1") int currentPage) {
		String userId = ((Member) session.getAttribute("loginUser")).getUserId();
		
		
		PageInfo pi = Pagination.getPageInfo(mypageService.getInquiryCount(userId), currentPage, 5, 5);
		ArrayList<Qna> inquiry = mypageService.inquiryHistory(userId, pi);
		
		if(inquiry != null) {
			session.setAttribute("inquiry", inquiry);
			session.setAttribute("pi", pi);
			return "mypage/inquiryHistory";
		} else {
			//errorpage
			return "";
		}
	}
	
	//내 댓글 관련 기능
	@RequestMapping("comment.my")
	public String myComment(HttpSession session, @RequestParam(value="page", defaultValue = "1") int currentPage) {
		String userId = ((Member) session.getAttribute("loginUser")).getUserId();
		PageInfo pi = Pagination.getPageInfo(mypageService.getMyCommentCount(userId), currentPage, 10, 5);
		ArrayList<Reply> comments = mypageService.getMyComments(userId, pi);
		
		if(comments != null) {
			session.setAttribute("comments", comments);
			session.setAttribute("pi", pi);
			return "mypage/myComment";
		} else {
			//errorpage
			return "";
		}
		
	}
	
	//채팅방 관련 기능
	@RequestMapping("myChatMenu.my")
	public String myChatMenu(HttpSession session) {
		
		String userId = ((Member) session.getAttribute("loginUser")).getUserId();
		
		ArrayList<ChatRoom> rooms = mypageService.getChatRooms(userId);

		if(rooms != null) {
			session.setAttribute("rooms", rooms);
		}else {
			//errorpage
			return "";
		}
		
		return "mypage/myChatMenu";
	}
	
	@ResponseBody
	@RequestMapping(value="getChat.my", produces="application/json; charset=UTF-8")
	public String getChats(HttpSession session, String chatRoomNo) {
		
		ArrayList<ChatMessage> chats = mypageService.getChats(chatRoomNo);
//		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd kk:mm:ss");
//		for(ChatMessage cm : chats) {
//			cm.setCreateDt(Timestamp.valueOf(sdf.format(cm.getCreateDt())));
//		}
		
		return new Gson().toJson(chats);
	}
	
	
	@ResponseBody
	@RequestMapping("addChat.my")
	public String addChatMember(String userId, HttpSession session) {
		int idCheck = memberService.idCheck(userId);
		
		if(idCheck>0) {
			String myUserId = ((Member) session.getAttribute("loginUser")).getUserId();
			
			int result = mypageService.addChatRoom(userId, myUserId);
			
			return result > 0 ? "NNNNN" : "NNNNY";
		}
		
		return "NNNNY";
		
	  }
	//내 여행코스 관련
	@RequestMapping("tripPlan.my")
	public String tripPlan(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session) {
		
		String userId = ((Member) session.getAttribute("loginUser")).getUserId();
		PageInfo pi = Pagination.getPageInfo(mypageService.selectCourseListCount(userId), currentPage, 5, 6);
		ArrayList<Planner> plan = mypageService.selectMyCourseList(pi, userId);

		session.setAttribute("pi", pi);
		session.setAttribute("myTripPlan", plan);
		
		return "mypage/myTripPlan";
	}
	
	//관심여행코스 관련
	@RequestMapping("interestTrip.my")
	public String interestTrip(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session) {
		
		String userId = ((Member) session.getAttribute("loginUser")).getUserId();
		PageInfo pi = Pagination.getPageInfo(mypageService.selectInterestCourseListCount(userId), currentPage, 5, 6);
		ArrayList<Planner> plan = mypageService.selectInterestCourseList(pi, userId);
		
		System.out.println(plan);
		session.setAttribute("pi", pi);
		session.setAttribute("likePlan", plan);
		
		return "mypage/myInterestTrip";
	}
}























