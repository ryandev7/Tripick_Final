package com.kh.tripick.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tripick.admin.model.service.AdminService;
import com.kh.tripick.admin.model.vo.Report;
import com.kh.tripick.common.model.vo.PageInfo;
import com.kh.tripick.common.template.Pagination;

@Controller
public class ReportController {
	
	@Autowired
	private AdminService adminService;
	
	// 리스트뷰 -> 신고된 게시판들의 리스트 페이징 처리기능 까지 함께 부여
	@RequestMapping("list.re")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = adminService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectListCount(), currentPage, 10, 5);
		
		ArrayList<Report> list = adminService.selectList(pi);
	
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("admin/reportListView");
		
		return mv;
	 }
	
	// 리스트뷰 -> 신고된 댓글의 리스트 페이징 처리기능 까지 함께 부여
	@RequestMapping("ReplyList.re")
	public ModelAndView selectReplyList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = adminService.selectReplyListCount();
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectReplyListCount(), currentPage, 10, 5);
		ArrayList<Report> list = adminService.selectReplyList(pi);
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("admin/reportReplyListView");
		
		return mv;
	 }
	
	// 디테일뷰 -> 신고된 게시판과 해당 게시판에 신고된 내용들이 중첩되서 나옴
	@RequestMapping("detail.re")
	public ModelAndView selectDetailAndRptList(@RequestParam String boardNo, String divCode, ModelAndView mv) {
		HashMap<String, String> map = new HashMap(); // 넘길 값이 두개이므로 HashMap으로 담아줌
		map.put("boardNo", boardNo);
		map.put("divCode", divCode);
		Report r = adminService.selectBoard(map);
		
		if(r.getDivCode().equals("L")) {
			r.setDivCode("지역게시판");
		}else if(r.getDivCode().equals("M")){
			r.setDivCode("동행게시판");
		}else {
			r.setDivCode("댓글");
		}
				
		ArrayList<Report> list = adminService.selectRptList(map);
		mv.addObject("r", r)
		  .addObject("rptList", list)
		  .setViewName("admin/reportDetailView");
		return mv;
	}
	
	// 신고된 게시글 디테일뷰에서 내용 확인 후  삭제 처리를 할 수 있도록 구현
	@RequestMapping("delete.re")
	public String deleteReport(int boardNo, HttpSession session, Model model, String divCode) {
		
		
		int result = 0;
		// 조건문 사용하여 divCode가 L 즉 equals(지역게시판)이면 deleteLocalBoard에 해당하는 SQL delete문이
		// divCode가 M 즉 equals(동행게시판)이면 deleteMateBoard에 해당하는 SQL delete문이 실행되도록 설정
		if(divCode.equals("지역게시판")) {
			result = adminService.deleteLocalBoard(boardNo);
		} else if(divCode.equals("동행게시판")) {
			result = adminService.deleteMateBoard(boardNo);
		} else {
			result = adminService.deleteReply(boardNo);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "신고 게시글이 삭제 되었습니다.");
		} else {
			model.addAttribute("errorMsg", "신고 게시글 삭제에 실패하였습니다.");
		}
		return "redirect:list.re";
	}
	
	
	 
}
