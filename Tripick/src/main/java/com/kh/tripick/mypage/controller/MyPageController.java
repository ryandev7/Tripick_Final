package com.kh.tripick.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.model.vo.Reply;
import com.kh.tripick.common.template.Pagination;
import com.kh.tripick.member.model.vo.Member;
import com.kh.tripick.mypage.model.service.MyPageService;
import com.kh.tripick.servicecenter.model.vo.Qna;

@Controller
public class MyPageController {

	
	@Autowired
	private MyPageService mypageService;
	
	
	//회원정보수정 관련
	@RequestMapping("memInfoChanForm.my")
	public String memberInfoChangeForm() {
		return "mypage/memberInfoChangeForm";
	}
	@RequestMapping("changeMemInfo.my")
	public String memberInfoChange(Member m, HttpSession session) {

		int result = mypageService.memberInfoChange(m);
		
		if(result > 0) {
			session.setAttribute("loginUser", m);
			return "redirect:/";
		} else {
			//errorpage
			return "";
		}
	}
	
	//회원탈퇴 관련
	@RequestMapping("deleteMemberForm.my")
	public String deleteMemberForm() {
		return "mypage/deleteMemberForm";
	}
	@RequestMapping("deleteMember.my")
	public String deleteMember(Member m, String withdrawal, HttpSession session) {
		
		int result = mypageService.deleteMember(m);
		
		if(result > 0) {
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
			return "mypage/inquiryHistory";
		} else {
			//errorpage
			return "";
		}
		
	}
}























